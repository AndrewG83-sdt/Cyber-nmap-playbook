#!/usr/bin/env bash
set -euo pipefail

TARGETS_FILE="${1:-targets.txt}"
if [[ ! -f "$TARGETS_FILE" ]]; then
  echo "File target non trovato: $TARGETS_FILE" >&2
  exit 1
fi

TS="$(date +"%Y-%m-%d_%H-%M-%S")"
OUTDIR="reports/${TS}"
mkdir -p "$OUTDIR"

while IFS= read -r HOST; do
  [[ -z "$HOST" || "$HOST" =~ ^# ]] && continue
  echo "[*] Scansione FULL TCP su $HOST ..."
  nmap -Pn -sS -p- -T3 -sV -O --version-light -oA "${OUTDIR}/${HOST}_fulltcp" "$HOST"
done < "$TARGETS_FILE"

echo "[+] Completato. Report in $OUTDIR"
