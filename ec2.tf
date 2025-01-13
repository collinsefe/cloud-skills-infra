# # # This file contains the configuration for creating EC2 instances

resource "aws_instance" "ansible" {
  ami                         = "ami-02f617729751b375a"
  instance_type               = "t2.micro"
  user_data                   = file("tools/ansible_install.sh")
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]

  tags = {
    Name : "ansible-control-node"
  }
}

resource "aws_instance" "java" {
  ami                         = "ami-02f617729751b375a"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]

  tags = {
    Name : "app-server"
  }
}

resource "aws_instance" "redis" {
  ami                         = "ami-02f617729751b375a"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]

  tags = {
    Name : "db-server"
  }
}


resource "aws_instance" "nginx" {
  ami                         = "ami-02f617729751b375a"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags = {
    Name : "web-server"
  }
}

