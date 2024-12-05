#!/bin/bash

# Ajouter le dépôt Cassandra
echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list

# Ajouter la clé GPG
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -

# Mettre à jour les paquets et installer Cassandra
sudo apt-get update
sudo apt-get install cassandra


# TODO : charlotte tu peux tester sur ton linux stp merci 
