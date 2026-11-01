#!/usr/bin/env python3
"""Extrae las anotaciones (correcciones) de un PDF a Markdown.

Para cada anotación recupera:
- el texto citado (el fragmento resaltado/subrayado bajo la anotación)
- el comentario del profesor (el contenido de la nota)
- la página y el autor

Uso:
    python3 scripts/extract_pdf_comments.py <ruta.pdf> [-o salida.md]

Requiere PyMuPDF (fitz).
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

try:
    import fitz  # PyMuPDF
except ImportError:
    sys.exit("Falta PyMuPDF. Instala con: pip install pymupdf")


def quoted_text(page: "fitz.Page", annot: "fitz.Annot") -> str:
    """Devuelve el texto cubierto por los quadpoints de la anotación.

    Los highlights/underline/strikeout guardan los vértices de cada línea
    resaltada en grupos de 4 puntos. Extraemos el texto de cada rectángulo
    y lo concatenamos.
    """
    vertices = annot.vertices
    if not vertices:
        # Sin quadpoints: usamos el rectángulo de la anotación como aproximación.
        return page.get_textbox(annot.rect).strip()

    parts: list[str] = []
    # Los vértices vienen en grupos de 4 (una línea resaltada por grupo).
    for i in range(0, len(vertices), 4):
        quad = vertices[i : i + 4]
        if len(quad) < 4:
            continue
        rect = fitz.Quad(quad).rect
        text = page.get_textbox(rect).strip()
        if text:
            parts.append(text)
    return " ".join(parts).strip()


def extract(pdf_path: Path) -> list[dict]:
    doc = fitz.open(pdf_path)
    items: list[dict] = []
    for page_index, page in enumerate(doc, start=1):
        for annot in page.annots() or []:
            info = annot.info
            comment = (info.get("content") or "").strip()
            cited = quoted_text(page, annot)
            items.append(
                {
                    "page": page_index,
                    "type": annot.type[1],
                    "author": (info.get("title") or "").strip(),
                    "cited": cited,
                    "comment": comment,
                }
            )
    doc.close()
    return items


def to_markdown(items: list[dict], source: str) -> str:
    lines = [f"# Correcciones extraídas de `{source}`", ""]
    lines.append(f"Total de anotaciones: **{len(items)}**")
    lines.append("")
    for n, it in enumerate(items, start=1):
        lines.append(f"## Comentario {n} — página {it['page']}")
        if it["author"]:
            lines.append(f"*Autor: {it['author']} · Tipo: {it['type']}*")
        lines.append("")
        lines.append("**Texto citado:**")
        lines.append("")
        if it["cited"]:
            lines.append("> " + it["cited"].replace("\n", "\n> "))
        else:
            lines.append("> _(sin texto citado)_")
        lines.append("")
        lines.append("**Corrección del profesor:**")
        lines.append("")
        lines.append(it["comment"] or "_(comentario vacío)_")
        lines.append("")
        lines.append("---")
        lines.append("")
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("pdf", type=Path, help="Ruta del PDF con comentarios")
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        default=None,
        help="Fichero Markdown de salida (por defecto: stdout)",
    )
    args = parser.parse_args()

    if not args.pdf.exists():
        sys.exit(f"No existe el fichero: {args.pdf}")

    items = extract(args.pdf)
    md = to_markdown(items, args.pdf.name)

    if args.output:
        args.output.write_text(md, encoding="utf-8")
        print(f"Escritas {len(items)} anotaciones en {args.output}")
    else:
        print(md)


if __name__ == "__main__":
    main()
