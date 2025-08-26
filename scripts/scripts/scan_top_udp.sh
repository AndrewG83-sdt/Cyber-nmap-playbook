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
  echo "[*] Scansione UDP top 200 su $HOST ..."
  nmap -Pn -sU --top-ports 200 --max-retries 2 --host-timeout 15m -oA "${OUTDIR}/${HOST}_topudp" "$HOST"
done < "$TARGETS_FILE"

echo "[+] Completato. Report in $OUTDIR"
