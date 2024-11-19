terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}


resource "aws_instance" "this" {
  ami = "ami-02f617729751b375a"
  # count         = 10
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.this.id
  # private_ip    = "10.0.10.250"

  tags = {
    Name = "Bank Application servers"
  }
}


resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "My Terraform VPC"
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "eu-west-2a"
  depends_on        = [aws_internet_gateway.gw]

  tags = {
    Name = "My Terraform Subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id
}

resource "aws_eip" "bar" {
  domain = "vpc"

  instance                  = aws_instance.this.id
  # associate_with_private_ip = "10.0.10.250"
  depends_on                = [aws_internet_gateway.gw]
}


resource "aws_ebs_volume" "example" {
  availability_zone = "eu-west-2a"
  size              = 1

  tags = {
    Name = "My Terraform EBS"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.this.id
}