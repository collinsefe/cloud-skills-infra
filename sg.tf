

resource "aws_default_vpc" "this" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "web" {
  name        = "my-web-security-group"
  description = "Allows Port SSH and HTTP Traffic"

  vpc_id = aws_default_vpc.this.id

  tags = {
    Name = "My Web Security Group"
  }

  ingress {
    description = "Allow SSH Traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = [aws_default_vpc.this]
  }

  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = [aws_default_vpc.this]
  }


  egress {
    description = "Allow All outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = [aws_default_vpc.this]

  }


  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

