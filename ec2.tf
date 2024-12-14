resource "aws_instance" "this" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Project Instance DO-NOT-DELETE"
  }
}
resource "aws_instance" "tennie" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "tennie-instance"
 }
}