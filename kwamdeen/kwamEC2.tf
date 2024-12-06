provider "aws" {
profile = "692859905059_AWSPowerUserAccess"
  region = "eu-west-2"
}

resource "aws_instance" "kwam_2" {
  ami           = "ami-0c76bd4bd302b30ec"
  instance_type = "t2.micro"

  key_name = "kwam-key"

  tags = {
    Name = "kwam_2"
  }
}
