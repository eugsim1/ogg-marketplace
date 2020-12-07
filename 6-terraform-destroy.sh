#terraform destroy -auto-approve -var-file="secret.tfvars"  -var-file=instance_count.tfvars  -var-file="terraform.tfvars"
terraform destroy   -auto-approve    -var-file="terraform.tfvars"   -var-file=instance_count.tfvars 
rm -rf ansible.log
rm -rf hosts
rm -rf student*.txt
rm -rf config