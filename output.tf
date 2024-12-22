output "ec2_end_point" {
  description = "endpoint for ec2 instance"
  value       = aws_instance.web.public_ip

}