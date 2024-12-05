#!/bin/bash

# Configuration du nœud 1
sudo sed -i 's/^cluster_name:.*/cluster_name: \x27MyCluster\x27/' /etc/cassandra/cassandra.yaml
sudo sed -i 's/^num_tokens:.*/num_tokens: 256/' /etc/cassandra/cassandra.yaml
sudo sed -i 's/^seed_provider:.*/seed_provider: \x27org.apache.cassandra.locator.SimpleSeedProvider\x27/' /etc/cassandra/cassandra.yaml
sudo sed -i 's/^seeds:.*/seeds: \x27192.168.1.1,192.168.1.2,192.168.1.3\x27/' /etc/cassandra/cassandra.yaml
sudo sed -i 's/^listen_address:.*/listen_address: 192.168.1.1/' /etc/cassandra/cassandra.yaml
sudo sed -i 's/^rpc_address:.*/rpc_address: 192.168.1.1/' /etc/cassandra/cassandra.yaml

# Configuration du nœud 2
ssh user@192.168.1.2 'sudo sed -i "s/^cluster_name:.*/cluster_name: \x27MyCluster\x27/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.2 'sudo sed -i "s/^num_tokens:.*/num_tokens: 256/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.2 'sudo sed -i "s/^seed_provider:.*/seed_provider: \x27org.apache.cassandra.locator.SimpleSeedProvider\x27/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.2 'sudo sed -i "s/^seeds:.*/seeds: \x27192.168.1.1,192.168.1.2,192.168.1.3\x27/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.2 'sudo sed -i "s/^listen_address:.*/listen_address: 192.168.1.2/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.2 'sudo sed -i "s/^rpc_address:.*/rpc_address: 192.168.1.2/" /etc/cassandra/cassandra.yaml'

# Configuration du nœud 3
ssh user@192.168.1.3 'sudo sed -i "s/^cluster_name:.*/cluster_name: \x27MyCluster\x27/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.3 'sudo sed -i "s/^num_tokens:.*/num_tokens: 256/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.3 'sudo sed -i "s/^seed_provider:.*/seed_provider: \x27org.apache.cassandra.locator.SimpleSeedProvider\x27/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.3 'sudo sed -i "s/^seeds:.*/seeds: \x27192.168.1.1,192.168.1.2,192.168.1.3\x27/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.3 'sudo sed -i "s/^listen_address:.*/listen_address: 192.168.1.3/" /etc/cassandra/cassandra.yaml'
ssh user@192.168.1.3 'sudo sed -i "s/^rpc_address:.*/rpc_address: 192.168.1.3/" /etc/cassandra/cassandra.yaml'


# TODO charlotte tu peux tester ça aussi stp ?