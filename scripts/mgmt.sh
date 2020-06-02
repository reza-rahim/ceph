#!/usr/bin/env bash

#sudo yum update -y

sudo yum -y install epel-release

sudo yum -y install ansible

sudo yum -y install python-pip python-dev

sudo yum -y install git

sudo mkdir /root/.ssh/

sudo cp -a /vagrant/scripts/id_rsa /root/.ssh/id_rsa
sudo chmod 600 /root/.ssh/id_rsa
sudo cat  /vagrant/scripts/authorized_keys >> /root/.ssh/authorized_keys


cat >> /root/.ssh/config <<EOL
Host *
  StrictHostKeyChecking no
EOL


# configure hosts file for our internal network defined by Vagrantfile
cat > /etc/hosts <<EOL

# vagrant environment nodes
127.0.0.1   localhost
192.168.50.100 skube-master-0
192.168.50.1 skube-storage-1
192.168.50.2 skube-storage-2
192.168.50.3 skube-storage-3
192.168.50.4 node5
192.168.50.5 node9
EOL

