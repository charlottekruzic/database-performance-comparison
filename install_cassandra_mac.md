# Installer Homebrew si ce n'est pas déjà fait
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installer Cassandra via Homebrew
brew install cassandra

brew services start cassandra


# Démarrer le nœud 1
cassandra -f -Dcassandra.config=/path/to/node1/cassandra.yaml

# Démarrer le nœud 2
cassandra -f -Dcassandra.config=/path/to/node2/cassandra.yaml

# Démarrer le nœud 3
cassandra -f -Dcassandra.config=/path/to/node3/cassandra.yaml




# Connexion au cluster Cassandra
cluster = Cluster(['127.0.0.1', '127.0.0.2', '127.0.0.3'])
session = cluster.connect()
