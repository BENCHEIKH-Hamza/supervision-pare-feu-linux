#!/bin/bash
# =============================================================
# Journalisation iptables (Machine 1)
# À exécuter APRÈS iptables-rules.sh
# Les règles LOG en fin de chaîne tracent les paquets qui vont
# être rejetés par la politique DROP.
# =============================================================

# Nouvelles connexions acceptées (insérée en tête de chaîne)
iptables -I INPUT 1 -m state --state NEW -j LOG --log-prefix "[IPTABLES-ACCEPT] " --log-level 4

# Paquets bloqués en entrée et en transit
iptables -A INPUT   -j LOG --log-prefix "[FW-DROP] " --log-level 4
iptables -A FORWARD -j LOG --log-prefix "[FW-DROP-FWD] " --log-level 4

echo "[OK] Journalisation activée."
echo "Consulter : sudo journalctl -k -f | grep -E 'FW-DROP|IPTABLES'"
