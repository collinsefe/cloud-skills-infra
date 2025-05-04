# This file contains the configuration for creating EC2 instances

resource "aws_instance" "this" {
  ami                         = var.ami_id
  count                       = 0
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = module.vpc.public_subnets[0]
  # user_data                   = file("./gitlab-runner.sh")
  key_name = aws_key_pair.this.key_name
  # user_data_replace_on_change = true
  connection {
    type = "ssh"
    user = "root"
    host = self.public_ip
  }

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_size           = 10
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = false
  }

  tags = {
    Name : var.gitlab_runner_name
  }
}
