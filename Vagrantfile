# -*- mode: ruby -*-
# vi: set ft=ruby :
# vagrant plugin install vagrant-disksize
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox"
  config.vm.hostname = "ctf"
  config.vm.network "private_network", ip: "192.168.33.101"
  config.disksize.size = "80GB"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 4096
  end
  config.vm.provision "shell",
    inline: 'sed -i.bak -e "s%http://[^ ]\+%https://linux.yz.yamagata-u.ac.jp/ubuntu/%g" /etc/apt/sources.list'
  config.vm.provision "shell", path: "scripts/pyenv.sh", privileged: false
  config.vm.provision "shell", path: "scripts/goenv.sh", privileged: false
  config.vm.provision "shell", path: "scripts/volatility.sh", privileged: false
  config.vm.provision "shell", path: "scripts/ghidra.sh", privileged: false
  config.vm.provision "shell", path: "scripts/gmpy2.sh", privileged: false
  config.vm.provision "shell", path: "scripts/wireshark.sh", privileged: false
  config.vm.provision "shell", path: "scripts/sage.sh", privileged: false
  config.vm.provision "shell", path: "scripts/radare2.sh", privileged: false
  config.vm.provision "shell", path: "scripts/gdb.sh", privileged: false
  config.vm.provision "shell", path: "scripts/hashpump.sh", privileged: false
  config.vm.provision "shell", path: "scripts/john-the-ripper.sh", privileged: false
  
end
