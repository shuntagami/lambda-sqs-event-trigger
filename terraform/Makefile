#!make

init:
	terraform init -force-copy -reconfigure

plan:
	terraform plan -input=false -var-file="tfvars/develop.tfvars"

apply:
	terraform apply -auto-approve -input=false -var-file="tfvars/develop.tfvars"

destroy:
	terraform destroy -auto-approve -var-file="tfvars/develop.tfvars"
