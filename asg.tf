#launch template
resource "aws_launch_template" "foo" {
  name_prefix   = "cloudskills-"
  image_id      = "ami-00710ab5544b60cf7"
  instance_type = "t2.micro"
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "cloud-web-server"
    }
  }

}

#auto scaling group
resource "aws_autoscaling_group" "bar" {
  name               = "cloudskills-terraform-asg"
  availability_zones = ["eu-west-2a"]
  desired_capacity   = 0
  max_size           = 20
  min_size           = 0

  launch_template {
    id      = aws_launch_template.foo.id
    version = "$Latest"
  }
}

