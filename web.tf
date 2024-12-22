resource "aws_instance" "web" {
  ami                         = "ami-0acc77abdfc7ed5a6"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.this.key_name
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
  #   vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  user_data = file("./web_server_install.sh")

  tags = {
    Name = "Web Server"
  }
}

