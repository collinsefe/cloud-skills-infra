# Specify the Terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

# Define the AWS provider
provider "aws" {
  region = "us-west-2" 
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316" 
  instance_type = "t2.micro"

  # Add a tag to the instance
  tags = {
    Name = "example-instance"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
