#!/bin/sh

# 1. Initialise terraform
terraform init

# 2. Format terraform file
terraform fmt

# 3. Validate terraform configuration
terraform validate

# 4. Show Terraform Plan
terraform plan

# 5. Deploy/delete the resources with terraform
terraform apply -auto-approve

