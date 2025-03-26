# # # # # This file contains the configuration for creating EC2 instances

resource "aws_instance" "this" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  count                       = 2 
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.public.id
#   user_data                   = file("./user-data.sh")
  user_data_replace_on_change = true
  connection {
    type     = "ssh"
    user     = "root"
    # password = var.root_password
    host     = self.public_ip
  }



  provisioner "file" {
    source      = "assets"
    destination = "/tmp/assets"
  }

  provisioner "remote-exec" {
    inline = [
      "yum update -y",
      "yum install -y httpd",
      "systemctl start httpd",
      "systemctl enable httpd",
      "sudo cp /tmp/assets/index.html /var/www/index/index.html",
      "sudo cp /tmp/assets/index.jpg /var/www/index/index.jpg",
    ]
  }
  tags = {
    Name : "mupando web server"
  }
}


# resource "aws_instance" "teni" {
#   ami                         = "ami-0a89c0e1fe86ef74e"
#   instance_type               = "t2.micro"
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [aws_security_group.web.id]
#   metadata_options {
#     http_tokens = "required"
#   }
#   root_block_device {
#     encrypted = true
#   }
#   ebs_block_device {
#     device_name           = "/dev/sdg"
#     volume_size           = 5
#     volume_type           = "gp2"
#     delete_on_termination = true
#     encrypted             = true
#   }
#   tags = {
#     Name : "tennie server"
#   }
# }

# resource "aws_instance" "abimbola" {
#   ami                         = "ami-02f617729751b375a"
#   instance_type               = "t2.micro"
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [aws_security_group.web.id]
#   metadata_options {
#     http_tokens = "required"
#   }
#   root_block_device {
#     encrypted = true
#   }
#   ebs_block_device {
#     device_name           = "/dev/sdg"
#     volume_size           = 5
#     volume_type           = "gp2"
#     delete_on_termination = true
#     encrypted             = true
#   }
#   tags = {
#     Name : "abimbola docker demo"
#   }
# }


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


