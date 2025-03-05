# resource "aws_instance" "web" {
#   # ...

#   provisioner "local-exec" {
#     command = "echo ${self.private_ip} >> private_ips.txt"
#   }
# }
