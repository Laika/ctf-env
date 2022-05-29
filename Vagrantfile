Vagrant.configure('2') do |config|
  # Base
  config.vm.box = 'ubuntu/focal64'
  config.vm.hostname = 'ctf'

  # Network
  config.vm.network 'private_network', ip: '192.168.56.100'

  # File system
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # Specification
  config.disksize.size = '80GB'
  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 2
    vb.memory = 4096
  end

  # SSH
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  # Provisioning
  config.vm.provision :ansible do |ansible|
    ansible.limit = 'all'
    ansible.playbook = 'playbook.yaml'
    ansible.inventory_path = 'hosts'
  end
end
# vim: set ft=ruby :
