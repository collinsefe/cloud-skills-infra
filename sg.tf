resource "aws_security_group" "main" {
  name        = "modules-security-group"
  description = "Allows Port SSH and HTTP Traffic"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Modules Security Group"
  }

  ingress {
    description = "Allow SSH Traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [aws_default_vpc.this.cidr_block]
  }

  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [aws_default_vpc.this.cidr_block]
  }

  egress {
    description = "Allow All outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [aws_default_vpc.this.cidr_block]

  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [aws_default_vpc.this.cidr_block]
  }
}
