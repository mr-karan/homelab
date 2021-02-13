.PHONY: init plan apply lint

plan:
	- terraform plan

init:
	- terraform init

apply:
    # that's how we roll here ;)
	- terraform apply -auto-approve

lint:
	- terraform validate && terraform fmt -recursive
