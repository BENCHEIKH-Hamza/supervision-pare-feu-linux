#!/bin/bash
# =============================================================
# Règles iptables du pare-feu Linux (Machine 1 — 10.0.0.1)
# WAN : enp0s3 | LAN : enp0s8 (10.0.0.0/24)
# Politique par défaut : DROP en entrée et en transit
# =============================================================

WAN=enp0s3
LAN=enp0s8
ZABBIX=10.0.0.100
PROMETHEUS=10.0.0.200
NETDATA=10.0.0.150

# --- Réinitialisation ---
iptables -F
iptables -t nat -F

# --- Politiques par défaut ---
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# --- Trafic local et connexions établies ---
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# --- Administration SSH ---
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# --- ICMP (ping) depuis le LAN ---
iptables -A INPUT -i $LAN -p icmp -j ACCEPT

# --- Flux de supervision (uniquement depuis les serveurs concernés) ---
iptables -A INPUT -p tcp --dport 10050 -s $ZABBIX     -j ACCEPT   # Zabbix Agent
iptables -A INPUT -p udp --dport 161   -s $ZABBIX     -j ACCEPT   # SNMP
iptables -A INPUT -p tcp --dport 9100  -s $PROMETHEUS -j ACCEPT   # Node Exporter
iptables -A INPUT -p tcp --dport 19999 -s $NETDATA    -j ACCEPT   # Netdata

# --- NAT : accès Internet pour le LAN ---
iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE
iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT
iptables -A FORWARD -i $WAN -o $LAN -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $LAN -o $LAN -j ACCEPT   # communication client1 <-> client2

echo "[OK] Règles iptables appliquées."
echo "Pour les rendre persistantes : sudo apt install iptables-persistent && sudo netfilter-persistent save"
