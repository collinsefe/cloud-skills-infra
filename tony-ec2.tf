resource "aws_instance" "foo" {
  ami           = "ami-02f617729751b375a" #
  instance_type = "t2.micro"

  tags = {
    Name : "Tony Instance"
  }
}

