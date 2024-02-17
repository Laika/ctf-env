# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 2.3.0'

host = RbConfig::CONFIG['host_os']

$mem = if host =~ /darwin/
         `sysctl -n hw.memsize`.to_i / 1024 / 1024
       elsif host =~ /linux/
         `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024
       else
         `wmic OS get TotalVisibleMemorySize`.split("\n")[2].to_i / 1024
       end
$mem = [$mem / 2, 4096].max

$cpus = ENV.fetch('CTFENV_CPUS', `nproc`.to_i / 4)
$mem = ENV.fetch('CTFENV_MEMORY', $mem)
$hostname = ENV.fetch('CTFENV_HOSTNAME', 'ctf.ctfenv.internal')
$vagrant_box = ENV.fetch('CTFENV_VAGRANT_BOX', 'ubuntu/jammy64')

$init_script = <<-EOF
  sed -i.bak -e 's/^#NTP=/NTP=ntp.nict.jp/g' /etc/systemd/timesyncd.conf
  timedatectl set-timezone Asia/Tokyo
  timedatectl set-ntp true
EOF
$init_user_script = <<-EOF
  curl -fsSL https://get.jetpack.io/devbox | bash -s -- --force
EOF

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "ctf" do |server|
    # Base
    server.vm.box = $vagrant_box
    server.vm.box_check_update = true
    server.vm.hostname = $hostname

    # Network
    server.vm.network 'private_network', ip: '192.168.56.100'
    server.vm.network 'forwarded_port', guest: 22, host: 12922, id: 'ssh'

    # File system
    server.vm.synced_folder '.', '/vagrant',
                            create: true, owner: 'vagrant', group: 'vagrant'
    server.vm.synced_folder './share', '/share',
                            create: true, owner: 'vagrant', group: 'vagrant'

    # Provision
    server.vm.provision 'shell', privileged: true, inline: $init_script
    server.vm.provision 'shell', privileged: false, inline: $init_user_script
    server.vm.provision 'ansible_local' do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "/vagrant/ansible/playbook.yaml"
      ansible.inventory_path = "/vagrant/ansible/hosts.yaml"
      ansible.config_file = "/vagrant/ansible/ansible.cfg"
    end

    # Specification
    server.vm.disk :disk, size: "80GB", primary: true
    server.vm.provider 'virtualbox' do |vb|
      vb.cpus = $cpus
      vb.memory = $mem
    end

    # SSH
    server.ssh.forward_agent = true
    server.ssh.forward_x11 = true
  end
end
