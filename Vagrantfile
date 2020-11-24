# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "private_network", ip: "192.168.33.101"
  config.disksize.size = "50GB"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 4096
  end
  config.vm.provision "shell", path: "scripts/pyenv.sh", privileged: false
  #config.vm.provision "shell", path: "scripts/radare2.sh", privileged: false
  #config.vm.provision "shell", path: "scripts/volatility.sh", privileged: false
end
