# # # # This file contains the configuration for creating EC2 instances

resource "aws_instance" "ansible" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  instance_type               = "t2.micro"
  user_data                   = file("tools/ansible_install.sh")
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.fix.id]
  tags = {
    Name : "ansible-control-node"
  }
}

resource "aws_instance" "java" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.fix.id]
  tags = {
    Name : "app-server"
  }
}

resource "aws_instance" "redis" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.fix.id]
  tags = {
    Name : "db-server"
  }
}


resource "aws_instance" "nginx" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.fix.id]
  tags = {
    Name : "web-server"
  }
}

