#launch template
resource "aws_launch_template" "foo" {
  name_prefix   = "cloudskills"
  image_id      = "ami-00710ab5544b60cf7"
  instance_type = "t2.micro"
}

#auto scaling group
resource "aws_autoscaling_group" "bar" {
  availability_zones = ["eu-west-2a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foo.id
    version = "$Latest"
  }
}