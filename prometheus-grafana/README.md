# Prometheus + Grafana — Machine 5 (10.0.0.200)

| Service | Port | Rôle |
|---|---|---|
| Prometheus 2.51.0 | 9090 | Collecte (pull) toutes les 15 s |
| Grafana | 3000 | Visualisation |
| Node Exporter 1.7.0 (sur le pare-feu) | 9100 | Exposition des métriques |

## Grafana
- Datasource : Prometheus → `http://10.0.0.200:9090`
- Dashboard importé : **Node Exporter Full (ID 1860)**, filtré sur `pare-feu-linux`

## Requêtes PromQL utilisées
```promql
rate(node_cpu_seconds_total[5m])
node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes
rate(node_network_transmit_bytes_total[5m])
node_time_seconds - node_boot_time_seconds
up{job="pare-feu"}
```
