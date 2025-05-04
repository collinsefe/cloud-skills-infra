# # # https://visualsubnetcalc.com/index.html?c=1N4IgbiBcIEwgNCARlEBGAnDAdGgbABzYAMJA9PgiALaoCCA6gMpUDOUoxA5hyMQBa9iASyEArXgDtUVAMYyAvojQTIoadDmKl6UWtir1MxPM06AzIZAaQWswp1pB+mHtAAWKzbu2dAVi9jEFNfCzcQPEDNE0VEAHYo2xj7BwcgA

resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/19"

  tags = {
    Name = "mupando-project-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.0.0/21"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "mupando-subnet-2a"
  }
}


resource "aws_subnet" "foo" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.16.0/21"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "mupando-subnet-2b"
  }
}


resource "aws_subnet" "bar" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.24.0/21"
  availability_zone = "eu-west-2c"

  tags = {
    Name = "mupando-subnet-2c"
  }
}



resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "mupando"
  }
}



#Create a Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "mupnado-public-route-table"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.bar.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_assoc_3" {
  subnet_id      = aws_subnet.foo.id
  route_table_id = aws_route_table.public_rt.id
}


#https://visualsubnetcalc.com/index.html?c=1N4IgbiBcIEwgNCARlEBGAnDAdGgbABzYAMJA9JgiALaoCCA6gMpUDOUoxAVhyMQNa9iAGyG1IwAL6I04qdPSiJsOQoDMqyQrSDlMJaAAsckADtUVAMYWFAVhPnoVm+oMg8Di4mtOFAdk8nbxctLSA

data "aws_availability_zones" "available" {}



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "gitlab-runners-vpc"

  cidr = "192.168.0.0/19"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["192.168.0.0/22", "192.168.4.0/22", "192.168.8.0/22"]
  public_subnets  = ["192.168.12.0/22", "192.168.16.0/22", "192.168.20.0/22"]

  enable_nat_gateway   = false
  single_nat_gateway   = false
  enable_dns_hostnames = true

  public_subnet_tags = {
    "Name"    = "Gitlab-VPC"
    "Project" = "gitlab-runners"
  }

  private_subnet_tags = {
    "Name"    = "Gitlab-VPC"
    "Project" = "gitlab-runners"
  }
}
