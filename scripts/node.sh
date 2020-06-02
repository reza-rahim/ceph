#!/usr/bin/env bash


sudo mkdir -p /root/.ssh/

sudo cp  /vagrant/scripts/authorized_keys  /root/.ssh/authorized_keys


# configure hosts file for our internal network defined by Vagrantfile
cat > /etc/hosts <<EOL

# vagrant environment nodes
127.0.0.1   localhost
192.168.50.100 skube-master-0
192.168.50.1 skube-storage-1
192.168.50.2 skube-storage-2
192.168.50.3 skube-storage-3
EOL

cat > /home/vagrant/.gitconfig <<EOL
[user]
        name = Reza Rahim
        email = rahimre@yahoo.com
EOL
