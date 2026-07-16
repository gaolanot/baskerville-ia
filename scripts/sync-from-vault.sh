#!/usr/bin/env bash
# sync-from-vault.sh
#
# Copia AGENTS.md, SOUL.md y la plantilla de postulación desde tu vault privado
# hacia este repo público, sanitizando automáticamente la línea VAULT_ROOT.
#
# NO toca Criterios de Evaluación.md, tu CV, ni la carpeta Postulaciones/ —
# esos archivos son personales y nunca deben salir de tu vault.
#
# Uso:
#   ./scripts/sync-from-vault.sh /ruta/a/tu/vault
# o exportando la variable antes de correrlo:
#   export VAULT_ROOT=/ruta/a/tu/vault
#   ./scripts/sync-from-vault.sh

set -euo pipefail

VAULT="${1:-${VAULT_ROOT:-}}"
if [ -z "$VAULT" ]; then
  echo "Error: especifica la ruta de tu vault como argumento o variable VAULT_ROOT."
  echo "Uso: ./scripts/sync-from-vault.sh /ruta/a/tu/vault"
  exit 1
fi

if [ ! -d "$VAULT" ]; then
  echo "Error: no existe el directorio '$VAULT'."
  exit 1
fi

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Vault de origen: $VAULT"
echo "Repo de destino: $REPO_DIR"
echo ""

# 1. Copiar AGENTS.md y sanitizar la línea de VAULT_ROOT
cp "$VAULT/AGENTS.md" "$REPO_DIR/AGENTS.md"
sed -i "s#^- \`VAULT_ROOT\`:.*#- \`VAULT_ROOT\`: /ruta/a/tu/vault  ← **reemplaza esto por la ruta real de tu vault/repositorio antes de usar el sistema**#" "$REPO_DIR/AGENTS.md"

# 2. Copiar SOUL.md (no debería contener nunca datos personales)
cp "$VAULT/SOUL.md" "$REPO_DIR/SOUL.md"

# 3. Copiar la plantilla de postulación (solo estructura, no contenido de postulaciones reales)
mkdir -p "$REPO_DIR/plantillas"
cp "$VAULT/99 Templates/Plantilla Postulación Laboral.md" \
   "$REPO_DIR/plantillas/Plantilla Postulación Laboral.md"

echo "Archivos sincronizados."
echo ""

# 4. Chequeo de seguridad: buscar rastros de rutas personales que se hayan colado
echo "Verificando que no queden rutas o datos personales..."
if grep -riE "/home/[a-z]+|/Users/[a-zA-Z]+|dropbox" "$REPO_DIR/AGENTS.md" "$REPO_DIR/SOUL.md" 2>/dev/null; then
  echo ""
  echo "⚠️  ADVERTENCIA: se encontraron posibles rutas personales arriba. Revisa antes de comitear."
else
  echo "✅ Sin rastros de rutas personales detectados."
fi

echo ""
echo "Siguiente paso — revisa el diff antes de comitear:"
echo "  cd \"$REPO_DIR\" && git diff"
