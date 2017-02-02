# Defines our Vagrant environment
##
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
      mgmt_config.vm.box = "ubuntu/trusty64"
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.vm.network :private_network, ip: "192.168.1.10"
#      mgmt_config.vm.network "forwarded_port", guest: 22, host: 2219
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
#     mgmt_config.vm.provision :shell, path: "scripts/dns_carrefour.sh"
#     mgmt_config.vm.provision :shell, path: "scripts/proxy_evry.sh"
      mgmt_config.vm.provision "ansible" do |ansible|
	    ansible.playbook = "provision/playbook.yml"
      end 
  end

  # create load balancer
  config.vm.define :lb do |lb_config|
      lb_config.vm.box = "ubuntu/trusty64"
      lb_config.vm.hostname = "lb"
      lb_config.vm.network :private_network, ip: "192.168.1.11"
      lb_config.vm.network "forwarded_port", guest: 80, host: 8080
      lb_config.vm.network "forwarded_port", guest: 22, host: 2220
      lb_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      lb_config.vm.provision :shell, path: "bootstrap.sh"
  end

  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..2).each do |i|
    config.vm.define "web#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "web#{i}"
        node.vm.network :private_network, ip: "192.168.1.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
#        node.vm.network "forwarded_port", guest: 22, host: "222#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
        node.vm.provision :shell, path: "bootstrap.sh"
    end
  end

end
