

resource "aws_default_vpc" "this" {
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_security_group" "fix" {
  name        = "my-fix-security-group"
  description = "Allows Port SSH and HTTP Traffic"

  vpc_id = aws_default_vpc.this.id

  tags = {
    Name = "Jenkins Security Group"
  }

  ingress {
    description = "Allow SSH Traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8080 Traffic for Jenkins Server"
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

