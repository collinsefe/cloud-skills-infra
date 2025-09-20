resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/24"

  tags = {
    Name = "automation-vpc"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.0.0/26"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "automation-private-subnet-2a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.0.64/26"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "automation-private-subnet-2b"
  }
}


resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.0.128/26"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "automation-public-subnet-2c"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.0.192/26"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "automation-public-subnet-2d"
  }
}
