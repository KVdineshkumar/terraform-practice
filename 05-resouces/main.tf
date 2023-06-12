

resource "aws_instance" "hey" {
  ami           = "sg-09a3d1d154d7ca8e2"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

#data "aws_ami" "example" {
#  owners      = ["973714476881"]
 # most_recent = true
#  name_regex  = "Centos-8-DevOps-Practice"
#}
