.PHONY: up start stop down provision plugin-install install ansible 

make = make --no-print-directory

up: 
	@$(make) start

start:
	vagrant up

stop:
	vagrant halt

down:
	vagrant halt
	vagrant destroy

provision:
	ANSIBLE_NOCOWS=1 vagrant provision

plugin-install:
	vagrant plugin install vagrant-disksize
	vagrant plugin install vagrant-vbguest

install:
	ANSIBLE_NOCOWS=1 ansible-playbook -i ansible/hosts.ini ansible/playbook.yaml

ansible:
	sudo apt-add-repository -y -u ppa:ansible/ansible && sudo apt install -y ansible
