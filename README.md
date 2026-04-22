# Cyber Nmap Playbook

Raccolta pratica di comandi e script per ricognizione di rete con Nmap, orientata a scansioni ripetibili, report salvati e confronto tra esecuzioni.

## Obiettivo

Questo repository nasce per standardizzare workflow di scansione ricorrenti in contesti autorizzati di laboratorio, assessment o verifica interna.

## Perche e utile

- rende piu ripetibili le scansioni piu comuni
- salva gli output in modo ordinato
- facilita il confronto tra run diversi per individuare drift di configurazione
- riduce il rischio di improvvisare comandi ogni volta

## Struttura

- `scripts/scan_fast.sh`
- `scripts/scan_full.sh`
- `scripts/scan_top_udp.sh`
- `scripts/diff_reports.sh`
- `targets.sample`
- `reports/example/`

## Workflow rapido

```bash
cp targets.sample targets.txt
nano targets.txt
bash scripts/scan_fast.sh targets.txt
bash scripts/scan_full.sh targets.txt
bash scripts/scan_top_udp.sh targets.txt
bash scripts/diff_reports.sh old.gnmap new.gnmap
```

## Casi d'uso

- baseline iniziale di un perimetro autorizzato
- confronto tra scansioni successive
- raccolta ordinata di evidenze tecniche
- supporto a report o attivita di hardening

## Requisiti

- Linux o macOS
- `bash`
- `nmap` disponibile nel `PATH`

## Nota etica

Uso esclusivamente difensivo e autorizzato. Questo repository non va utilizzato su asset, reti o servizi senza permesso esplicito.
