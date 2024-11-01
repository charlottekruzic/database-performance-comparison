
# préerquis : avoir java, sinon : sudo apt install openjdk-11-jdk -y
    
    pip install -r requirements.txt
    sudo apt install curl gnupg -y
    curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -
    echo "deb [arch=amd64] https://debian.cassandra.apache.org 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.list
    sudo apt update
    sudo apt install cassandra -y
    sudo systemctl start cassandra
    sudo apt install mysql-server -y
    sudo systemctl start mysql
    
    sudo mysql -u root -p
        
        CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
        CREATE DATABASE TDLE;
        GRANT ALL PRIVILEGES ON TDLE.* TO 'user'@'localhost';
        FLUSH PRIVILEGES;
        EXIT;

