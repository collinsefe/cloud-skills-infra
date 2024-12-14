resource "aws_instance" "this" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Project Instance DO-NOT-DELETE"
  }
}

resource "aws_instance" "bar" {
  ami           = "ami-02f617729751b375a" 
  instance_type = "t2.micro"

  tags = {
    Name : "Collins Instance"
  }
}

resource "aws_instance" "kwamdeen" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Kwamdeen Ayinla"
  }
}
