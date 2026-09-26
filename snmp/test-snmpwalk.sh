#!/bin/bash
# À exécuter depuis Machine 4 (Zabbix — 10.0.0.100)
snmpwalk -v2c -c public 10.0.0.1 system
