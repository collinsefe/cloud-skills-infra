resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/24"

  tags = {
    Name = "automation-vpc"
  }
}

resource "aws_subnet" "sub_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.0.0/26"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "automation-subnet-2a"
  }
}

resource "aws_subnet" "sub_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.0.64/26"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "automation-subnet-2b"
  }
}


# extra subnets 
# "172.16.0.128/26"
# "172.16.0.192/26"