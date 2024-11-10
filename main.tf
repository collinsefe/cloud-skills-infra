resource "aws_instance" "this" {
  ami           = "ami-02f617729751b375a" #
  count         = 1
  instance_type = "t2.micro"

  tags = {
    Name : "CloudSkills Instance"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "CloudSkills VPC"
  }
}


resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "CloudSkills Subnet"
  }
}


resource "aws_eip" "this" {
  domain = "vpc"

  instance   = aws_instance.this.id
  # depends_on = [aws_internet_gateway.this]
   tags = {
    Name = "CloudSkills EIP"
  }
}

resource "aws_ebs_volume" "this" {
  availability_zone = "eu-west-2a"
  size              = 40

   tags = {
    Name = "CloudSkills Volume"
  }

}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.this.id
  instance_id = aws_instance.this.id
}
