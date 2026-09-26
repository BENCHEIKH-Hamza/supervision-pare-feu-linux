# Netdata — Machine 6 (10.0.0.150)

Mode **streaming parent/enfant** : le pare-feu envoie ses métriques en temps réel au nœud parent.

1. Installer Netdata sur les deux machines :
   ```bash
   wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh
   ```
2. Copier `stream.conf.parent` sur Machine 6 et `stream.conf.child` sur le pare-feu
3. `sudo systemctl restart netdata` sur les deux
4. Dashboard : http://10.0.0.150:19999

Résultat : 2 nœuds live, ~3 000 métriques, 523 graphiques, granularité 1 seconde.
