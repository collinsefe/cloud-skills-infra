resource "aws_instance" "this" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Project Instance DO-NOT-DELETE"
  }
}

resource "aws_instance" "dev-1" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Developer 1"
  }
}

resource "aws_instance" "dev-2" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Developer 2"
  }
}

resource "aws_instance" "fish" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Collins Instance"
  }
}





