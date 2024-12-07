resource "aws_instance" "tennie" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  key_name      = "tennie key"
  tags = {
    Name = "tennie-instance"
  } 
}