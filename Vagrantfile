# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :master do |mgmt_config|
      mgmt_config.vm.box = "bento/centos-7.6"
      mgmt_config.vm.hostname = "skube-master-0"
      mgmt_config.vm.network :private_network, ip: "192.168.50.100"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = "4"
        #unless File.exist?('./mgmt_disk1.vdi')
        #  vb.customize ['createhd', '--filename', './mgmt_disk1.vdi', '--size', 500 * 1024]
        #end
        #  vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', './mgmt_disk1.vdi']
      end
      mgmt_config.vm.provision :shell, path: "scripts/mgmt.sh"
  end

  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..3).each do |i|
    config.vm.define "storage#{i}" do |node|
        node.vm.box = "bento/centos-7.6"
        node.vm.hostname = "skube-storage#{i}"
        node.vm.network :private_network, ip: "192.168.50.#{i}"
        node.vm.provider "virtualbox" do |vb|

          vb.memory = "2048"
          vb.cpus = "4"

          disk1="./node#{i}_disk1.vdi"
          disk2="./node#{i}_disk2.vdi"

          unless File.exist?(disk1)
             vb.customize ['createhd', '--filename', disk1, '--size', 500 * 1024]
          end
          vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk1]

          unless File.exist?(disk2)
             vb.customize ['createhd', '--filename', disk2, '--size', 500 * 1024]
          end
          vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk2]

        end
        node.vm.provision :shell, path: "scripts/node.sh"
    end
  end
end
