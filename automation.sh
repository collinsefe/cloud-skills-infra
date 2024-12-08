#!/bin/sh

terraform init

terraform fmt

terraform validate

terraform plan

terraform apply -auto-approve

