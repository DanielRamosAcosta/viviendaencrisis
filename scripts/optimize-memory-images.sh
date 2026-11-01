#!/usr/bin/env bash
# Optimiza las imágenes de gran resolución de la memoria para reducir el peso
# del PDF compilado, CONSERVANDO los originales.
#
# Typst embebe los PNG/WebP tal cual (no recomprime ni re-muestrea), por lo que
# una exportación a 24000px pesa decenas de MB en el PDF. Este script separa:
#   - docs/memory/images-src/  -> ORIGINALES de alta resolución (fuente de verdad)
#   - docs/memory/images/      -> derivados optimizados que consume `typst compile`
#
# Las rutas en los .typ (/images/...) no cambian. Para regenerar los derivados
# tras actualizar un original, vuelve a ejecutar este script.
#
# Requiere ImageMagick (magick). Uso: bash scripts/optimize-memory-images.sh
set -euo pipefail

MEM_DIR="$(cd "$(dirname "$0")/../docs/memory" && pwd)"
IMG="$MEM_DIR/images"
SRC="$MEM_DIR/images-src"
MAX_WIDTH=2400   # ancho máximo en px; suficiente para A4 a ~300 DPI

mkdir -p "$SRC"

# Imágenes a optimizar (exportaciones de gran dimensión). El resto se deja igual.
TARGETS=(
  "empathy-map.png"
  "user-personae.png"
  "Card Sorting_ Cristina.png"
  "Card Sorting_ Alex.png"
  "Card Sorting_ Ileana.png"
  "sitemap.png"
  "DesignSystem.png"
  "benchmarking.webp"
)

for name in "${TARGETS[@]}"; do
  # Si aún no hay original guardado, mueve el actual a images-src/ como fuente.
  if [[ ! -f "$SRC/$name" ]]; then
    if [[ -f "$IMG/$name" ]]; then
      mv "$IMG/$name" "$SRC/$name"
    else
      echo "AVISO: no existe $name ni en images/ ni en images-src/, se omite."
      continue
    fi
  fi

  # Genera el derivado optimizado desde el original (solo reduce si es más ancho).
  magick "$SRC/$name" -resize "${MAX_WIDTH}>" -strip "$IMG/$name"

  before=$(du -h "$SRC/$name" | cut -f1)
  after=$(du -h "$IMG/$name" | cut -f1)
  printf "%-28s %6s -> %6s\n" "$name" "$before" "$after"
done

echo "Hecho. Originales en images-src/, derivados optimizados en images/."
