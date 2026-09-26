-- Création de la base Zabbix (Machine 4)
-- Exécuter avec : sudo mysql < mysql-setup.sql
-- ⚠️ Remplacer CHANGE_ME par un mot de passe robuste

CREATE DATABASE zabbix CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'CHANGE_ME';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';
SET GLOBAL log_bin_trust_function_creators = 1;

-- Après import du schéma :
-- zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix
-- puis : SET GLOBAL log_bin_trust_function_creators = 0;
