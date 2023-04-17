# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
  config.ssh.insert_key = false

  config.vm.define "docker" do |docker|
    docker.vm.box = "shekeriev/debian-11"
    docker.vm.hostname = "docker.do2.hw"
    docker.vm.network "private_network", ip: "192.168.89.121"
    docker.vm.network "forwarded_port", guest: 80, host: 8080
  end

  config.vm.define "web" do |web|
    web.vm.box = "shekeriev/debian-11"
    web.vm.hostname = "web.do2.hw"
    web.vm.network "private_network", ip: "192.168.89.122"
    web.vm.network "forwarded_port", guest: 80, host: 8081
    web.vm.provision "shell", path: "add-hosts.sh"
  end
  
  config.vm.define "db" do |db|
    db.vm.box = "shekeriev/centos-stream-9"
    db.vm.hostname = "db.do2.hw"
    db.vm.network "private_network", ip: "192.168.89.123"
    db.vm.provision "shell", path: "add-hosts.sh"
  end
 
  config.vm.define "ans" do |ans|
    ans.vm.box = "shekeriev/debian-11"
    ans.vm.hostname = "ans.do2.hw"
    ans.vm.network "private_network", ip: "192.168.89.120"
    #ans.vm.synced_folder "vagrant/", "/vagrant"
    ans.vm.provision "shell", path: "install-ansible.sh"
    ans.vm.provision "shell", path: "plays-setup.sh"
  end

end
