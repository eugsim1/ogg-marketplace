##terraform apply -no-color -auto-approve -var-file="secrets-prod.tfvars"   -var-file=instance_count.tfvars  -var-file="terraform.tfvars" 

terraform apply -no-color -auto-approve     -var-file="terraform.tfvars" -parallelism=30
