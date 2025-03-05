# #launch template
# resource "aws_launch_template" "main" {
#   name_prefix   = "mupando-"
#   image_id      = "ami-00710ab5544b60cf7"
#   instance_type = "t2.micro"
#   key_name      = "web-app-key"
#   user_data     = base64encode(file("user-data.sh"))

#   network_interfaces {
#     associate_public_ip_address = true
#     security_groups             = [aws_security_group.main.id]
#   }

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "cloud-web-server"
#     }
#   }

# }

# # #auto scaling group
# resource "aws_autoscaling_group" "main" {
#   name                = "mupando-terraform-asg"
#   vpc_zone_identifier = [aws_subnet.public.id, aws_subnet.foo.id, aws_subnet.bar.id] #["subnet-12345678", "subnet-87654321"]
#   desired_capacity    = 0
#   max_size            = 6
#   min_size            = 0

#   launch_template {
#     id      = aws_launch_template.main.id
#     version = "$Latest"
#   }
# }



# resource "aws_autoscaling_policy" "scale_up" {
#   name                   = "scale-up"
#   scaling_adjustment     = 1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 60
#   autoscaling_group_name = aws_autoscaling_group.main.name
# }

# resource "aws_autoscaling_policy" "scale_down" {
#   name                   = "scale-down"
#   autoscaling_group_name = aws_autoscaling_group.main.name
#   adjustment_type        = "ChangeInCapacity"
#   scaling_adjustment     = -1
#   cooldown               = 60
# }

# resource "aws_cloudwatch_metric_alarm" "cpu_high" {
#   alarm_name          = "cpu-high"
#   comparison_operator = "GreaterThanThreshold"
#   evaluation_periods  = 2
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = 60
#   statistic           = "Average"
#   threshold           = 70
#   alarm_actions       = [aws_autoscaling_policy.scale_up.arn]
#   dimensions = {
#     AutoScalingGroupName = aws_autoscaling_group.main.name
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "cpu_low" {
#   alarm_name          = "cpu-low"
#   comparison_operator = "LessThanThreshold"
#   evaluation_periods  = 2
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = 60
#   statistic           = "Average"
#   threshold           = 30
#   alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
#   dimensions = {
#     AutoScalingGroupName = aws_autoscaling_group.main.name
#   }
# }