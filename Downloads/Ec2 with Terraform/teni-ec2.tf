provider "aws" {
  profile = "692859905059_AWSPowerUserAccess"
  region = "eu-west-2"
}

resource "aws_instance" "Teni" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  key_name      = "tennie key"
  tags = {
    Name = "Teni-Instance"
  }
}
