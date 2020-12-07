##mkdir -p config
##cp credentials.txt  config/db-credentials.txt
rm -rf terraform.tstate*
terraform plan    -no-color    -var-file="terraform.tfvars"  
###> plan_out.txt

##terraform plan  -target=module.database19  -no-color -var-file="secret.tfvars"   -var-file=instance_count.tfvars  -var-file="terraform.tfvars"  
###> plan_out.txt
