

resource "aws_instance" "bar" {
    ami           = "ami-02f617729751b375a" 
      instance_type = "t2.micro"

        tags = {
              Name : "Bimbo Instance"
                }
              }

