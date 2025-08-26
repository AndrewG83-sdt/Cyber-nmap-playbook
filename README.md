# Cyber Nmap Playbook
Raccolta pratica di comandi e script per ricognizione di rete con Nmap.  
Focus su **scansioni ripetibili**, **report** e **diff** tra run.

## Perché è utile
- Standardizza le scansioni più comuni (rapida, completa TCP 1–65535, top UDP, NSE mirati).
- Genera report salvati in `reports/` con timestamp.
- Confronta due run per evidenziare porte nuove/chiuse (drift di configurazione).

## Requisiti
- Linux/macOS, `bash`, `nmap` in `$PATH`.
- Uso etico: solo su asset autorizzati.

## Struttura
scripts/scan_fast.sh
scripts/scan_full.sh
scripts/scan_top_udp.sh
scripts/diff_reports.sh
targets.sample
reports/example/

## Uso rapido
```bash
cp targets.sample targets.txt && nano targets.txt
bash scripts/scan_fast.sh targets.txt
bash scripts/scan_full.sh targets.txt
bash scripts/scan_top_udp.sh targets.txt
bash scripts/diff_reports.sh old.gnmap new.gnmap
