
# resource "aws_vpc" "this" {
#   cidr_block = "10.0.0.0/16"
# }


# resource "aws_subnet" "this" {
#   vpc_id                  = aws_vpc.this.id
#   cidr_block              = "10.0.0.0/24"
#   map_public_ip_on_launch = true
#   depends_on = [aws_internet_gateway.this]
# }

# resource "aws_internet_gateway" "this" {
# }
