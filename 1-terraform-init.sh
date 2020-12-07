sudo rm -rf .terraform
sudo rm -rf config/*
##rm -rf terraform.tfstate terraform.tfstate.backup
terraform fmt
terraform init
