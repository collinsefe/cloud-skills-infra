resource "aws_instance" "this" {
  ami           = "ami-02f617729751b375a" #
  instance_type = "t2.micro"

  tags = {
    Name : "Collins Instance"
  }
}

