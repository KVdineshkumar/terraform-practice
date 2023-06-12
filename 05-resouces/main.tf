

resource "aws_instance" "hey" {
  ami           = ami-03265a0778a880afb
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}