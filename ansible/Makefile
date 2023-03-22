.PHONY: plugin-install install ansible 

make = make --no-print-directory

plugin-install:
	vagrant plugin install vagrant-disksize
	vagrant plugin install vagrant-vbguest

install:
	ANSIBLE_NOCOWS=1 ansible-playbook -i hosts playbook.yaml
	@echo "[+] Installation finished. Restart your shell."

ansible:
	sudo apt-add-repository -y -u ppa:ansible/ansible && sudo apt install -y ansible
