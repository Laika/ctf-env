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

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 4096
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yaml"
  end

end
