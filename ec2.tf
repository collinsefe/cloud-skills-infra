# # This file contains the configuration for creating EC2 instances

resource "aws_instance" "this" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "ansible node"
  }
}

resource "aws_instance" "java" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "java node"
  }
}

resource "aws_instance" "redis" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "redis node"
  }
}


resource "aws_instance" "nginx" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "nginx node"
  }
}

