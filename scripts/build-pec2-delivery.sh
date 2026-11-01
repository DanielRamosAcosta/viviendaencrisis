#!/usr/bin/env bash
# Monta el paquete de entrega de la PEC2 conforme al enunciado del aula.
#
# Estructura generada (en delivery/):
#   PEC2_Ramos_Acosta_Daniel/
#     documentacion/
#       PEC2_mem_Ramos_Acosta_Daniel.pdf     (la memoria compilada)
#     proyecto/
#       PEC2_pry_Ramos_Acosta_Daniel/         (prototipo apps/wireframe, sin node_modules)
#   PEC2_Ramos_Acosta_Daniel.zip              (el ZIP listo para subir)
#
# Requisitos: la memoria debe estar compilada en docs/memory/main.pdf
# (ejecuta antes: typst compile docs/memory/main.typ docs/memory/main.pdf).
#
# Uso: bash scripts/build-pec2-delivery.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APELLIDOS_NOMBRE="Ramos_Acosta_Daniel"
OUT="$ROOT/delivery"
PKG="$OUT/PEC2_${APELLIDOS_NOMBRE}"
MEM_PDF="$ROOT/docs/memory/main.pdf"
PROTO_SRC="$ROOT/apps/wireframe"

if [[ ! -f "$MEM_PDF" ]]; then
  echo "ERROR: no existe $MEM_PDF. Compila la memoria primero:"
  echo "  typst compile docs/memory/main.typ docs/memory/main.pdf"
  exit 1
fi

# Staging limpio
rm -rf "$PKG" "$OUT/PEC2_${APELLIDOS_NOMBRE}.zip"
mkdir -p "$PKG/documentacion" "$PKG/proyecto/PEC2_pry_${APELLIDOS_NOMBRE}"

# 1) Memoria (PDF renombrado)
cp "$MEM_PDF" "$PKG/documentacion/PEC2_mem_${APELLIDOS_NOMBRE}.pdf"

# 1b) Checklist (validado por el tutor antes de la entrega definitiva)
if [[ -f "$ROOT/docs/checklist_es.md" ]]; then
  cp "$ROOT/docs/checklist_es.md" "$PKG/documentacion/PEC2_checklist_${APELLIDOS_NOMBRE}.md"
fi

# 2) Proyecto: prototipo, excluyendo artefactos no fuente
rsync -a \
  --exclude 'node_modules' \
  --exclude 'dist' \
  --exclude '.git' \
  --exclude 'test-results' \
  --exclude 'playwright-report' \
  --exclude 'CLAUDE.md' \
  "$PROTO_SRC/" "$PKG/proyecto/PEC2_pry_${APELLIDOS_NOMBRE}/"

# 3) ZIP final
( cd "$OUT" && zip -r -q "PEC2_${APELLIDOS_NOMBRE}.zip" "PEC2_${APELLIDOS_NOMBRE}" )

echo "Paquete listo:"
echo "  $PKG/"
du -sh "$PKG" | awk '{print "  (carpeta: "$1")"}'
echo "  $OUT/PEC2_${APELLIDOS_NOMBRE}.zip"
du -sh "$OUT/PEC2_${APELLIDOS_NOMBRE}.zip" | awk '{print "  (zip: "$1")"}'
