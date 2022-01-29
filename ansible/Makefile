deps:
	ansible-galaxy install gantsign.oh-my-zsh
	ansible-galaxy install cloudalchemy.node_exporter

ping:
	ansible -i inventory 'all' -m ping

bootstrap:
	ansible-playbook -i inventory server.yml --tags "bootstrap" -e 'ansible_user=root'

docker:
	ansible-playbook -i inventory server.yml --tags "docker"

zsh:
	ansible-playbook -i inventory server.yml --tags "zsh"

tailscale:
	ansible-playbook -i inventory server.yml --tags "tailscale"

deploy-svcs:
	ansible-playbook -i inventory services.yml -e @secrets.enc --vault-password-file=.vault_password

list-tasks:
	ansible-playbook -i inventory server.yml --list-tasks --tags="bootstrap"

view-secrets:
	ansible-vault view secrets.enc --vault-password-file=.vault_password

edit-secrets:
	EDITOR=vim ansible-vault edit secrets.enc --vault-password-file=.vault_password

encrypt-secrets:
	EDITOR=vim ansible-vault encrypt secrets.enc --vault-password-file=.vault_password

decrypt-secrets:
	EDITOR=vim ansible-vault decrypt secrets.enc --vault-password-file=.vault_password
