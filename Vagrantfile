Vagrant.configure('2') do |config|
  # Base
  config.vm.box = 'ubuntu/focal64'
  config.vm.box_check_update = true
  config.vm.hostname = 'ctf'

  # Network
  config.vm.network 'private_network', ip: '192.168.56.100'

  # File system
  config.vm.synced_folder './ansible', '/home/vagrant/ansible',
    create: true, owner: 'vagrant', group: 'vagrant'

  # Specification
  config.disksize.size = '80GB'
  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 4
    vb.memory = 8192
  end

  # SSH
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  # Provisioning
  # config.vm.provision :ansible_local do |ansible|
  #  ansible.limit = 'all'
  #  ansible.playbook = '/home/vagrant/ansible/playbook.yaml'
  #  ansible.inventory_path = '/home/vagrant/ansible/hosts'
  #end
end
# vim: set ft=ruby :
