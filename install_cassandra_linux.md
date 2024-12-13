# Installation de SQLite
echo "Installation de SQLite..."
sudo apt install sqlite3 -y

# Vérification de l'installation de SQLite
echo "Vérification de SQLite..."
sqlite3 --version

# Installation de Cassandra
echo "Ajout du dépôt Cassandra et installation..."
echo "deb https://apache.claz.org/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt update
sudo apt install cassandra -y

# Démarrage et activation de Cassandra
echo "Démarrage de Cassandra..."
sudo systemctl enable cassandra
sudo systemctl start cassandra

# Vérification que Cassandra fonctionne
echo "Vérification de Cassandra..."
nodetool status

# TODO CHARLOTTE TEST ÇA STP 