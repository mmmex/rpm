# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = 'almalinux/8'

  config.vm.define "server" do |server|

    server.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    server.vm.host_name = 'server'
    server.vm.network :private_network, ip: "192.168.56.11"
    server.vm.provision "shell", name: "Init script", path: "cript.sh"
  end

end
