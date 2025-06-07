# # # # # This file contains the configuration for creating EC2 instances

resource "aws_instance" "this" {
  ami                         = "ami-0a89c0e1fe86ef74e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  #   vpc_security_group_ids      = [aws_security_group.web.id]
  subnet_id = aws_subnet.sub_a.id
  root_block_device {
    encrypted = true
  }

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_size           = 5
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name : "automation server"
  }
}
