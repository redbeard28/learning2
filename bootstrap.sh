#!/usr/bin/env bash
##################################################################
#
#       bootstrap.sh
#           01/02/2017 by redbeard28
#               v0.1
###################################################################

# copy ssh keys
cat /vagrant/.ssh/id_rsa > /home/vagrant/.ssh/id_rsa
cat /vagrant/.ssh/id_rsa.pub > /home/vagrant/.ssh/id_rsa.pub
cat /vagrant/.ssh/authorized_keys >> /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant
chmod 600 /home/vagrant/.ssh/id_rsa

# Install some stuff
#sudo /vagrant/scripts/dns.sh
#sudo /vagrant/scripts/proxy_evry.sh
#sudo /vagrant/scripts/install_ansible_ubuntu.sh


# configure hosts file for our internal network defined by Vagrantfile
cat > /etc/hosts <<EOL
######## MANAGED BY VAGRANT
127.0.0.1 localhost

### MGMT
192.168.1.10    mgmt

### LoadBalancer
192.168.1.11    lb

### WebHost
EOL

for i in {1..9}
        do
        echo "192.168.1.2$i   web$i" >> /etc/hosts
        done

