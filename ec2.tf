# # # # # This file contains the configuration for creating EC2 instances

# resource "aws_instance" "ansible" {
#   ami                         = "ami-0a89c0e1fe86ef74e"
#   instance_type               = "t2.micro"
#   user_data                   = file("tools/ansible_install.sh")
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [aws_security_group.web.id]
#   key_name                    = "ansible"
#   provisioner "file" {
#     source      = "ansible-configuration"
#     destination = "ansible"
#   }

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = aws_key_pair.this.id
#     host        = aws_instance.ansible.public_ip
#     port        = 22
#   }
#   tags = {
#     Name : "ansible-control-node"
#   }
# }

resource "aws_instance" "this" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags = {
    Name : "collins server"
  }
}

resource "aws_instance" "this" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags = {
    Name : "tennie server"
  }
}
