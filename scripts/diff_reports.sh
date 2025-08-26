#!/usr/bin/env bash
set -euo pipefail

OLD="${1:-}"
NEW="${2:-}"
if [[ -z "$OLD" || -z "$NEW" ]]; then
  echo "Uso: bash scripts/diff_reports.sh <old.gnmap> <new.gnmap>" >&2
  exit 1
fi

echo "[*] Confronto porte tra report:"
echo "    OLD: $OLD"
echo "    NEW: $NEW"
echo

old_ports=$(grep -oP '\d+/(open|closed|filtered)' "$OLD" | sort -u)
new_ports=$(grep -oP '\d+/(open|closed|filtered)' "$NEW" | sort -u)

echo ">> Porte nuove (presenti in NEW ma non in OLD):"
comm -13 <(echo "$old_ports") <(echo "$new_ports") || true
echo
echo ">> Porte scomparse (presenti in OLD ma non in NEW):"
comm -23 <(echo "$old_ports") <(echo "$new_ports") || true
