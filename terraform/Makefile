#!make

init:
	terraform init -force-copy -reconfigure

plan:
	terraform plan -input=false

apply:
	terraform apply -auto-approve -input=false

destroy:
	terraform destroy -auto-approve -var-file="tfvars/develop.tfvars"
