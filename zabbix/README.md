# Zabbix — Machine 4 (10.0.0.100)

| Élément | Valeur |
|---|---|
| Hôte supervisé | `Par-feu` — 10.0.0.1, port 10050 |
| Template | Linux by Zabbix agent |
| Interface web | http://10.0.0.100/zabbix |

## Triggers configurés
- CPU > 80 %
- Espace disque faible
- Hôte injoignable

## Étapes
1. Installer Zabbix Server, frontend, MySQL et Apache
2. Créer la base avec `mysql-setup.sql`
3. Renseigner `zabbix_server.conf` (voir `.example`)
4. Installer l'agent sur le pare-feu avec `zabbix_agentd.conf.example`
5. Ajouter l'hôte `Par-feu` dans l'interface web
