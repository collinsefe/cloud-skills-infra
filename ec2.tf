resource "aws_instance" "this" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Project Instance DO-NOT-DELETE"
  }
}

resource "aws_instance" "gbos" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Bimbo Instance"
  }
}

resource "aws_instance" "bar" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  tags = {
    Name : "Collins Instance"
  }
}

resource "aws_instance" "kwam_2" {
  ami           = "ami-0c76bd4bd302b30ec"
  instance_type = "t2.micro"
  key_name      = "kwam-key"
  tags = {
    Name = "Kwam instance"
  }
}

resource "aws_instance" "tennie" {
  ami           = "ami-02f617729751b375a"
  instance_type = "t2.micro"
  key_name      = "tennie key"
  tags = {
    Name = "tennie-instance"
  }
}

