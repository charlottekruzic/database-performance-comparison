# Installation de SQLite
echo "Installation de SQLite..."
sudo apt install sqlite3 -y

# Vérification de l'installation de SQLite
echo "Vérification de SQLite..."
sqlite3 --version

# Installation de Cassandra
echo "Ajout du dépôt Cassandra et installation..."
echo "deb [arch=amd64] https://debian.cassandra.apache.org/ 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.list
curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -
sudo apt update
sudo apt install cassandra -y

# Démarrage et activation de Cassandra
echo "Démarrage de Cassandra..."
sudo systemctl enable cassandra
sudo systemctl start cassandra

# Vérification que Cassandra fonctionne
echo "Vérification de Cassandra..."
nodetool status