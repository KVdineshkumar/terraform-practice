resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.name
  }
  provisioner "remote-exec" {
    connection {
      type    = "ssh"
      user    = "centos"
      password = "DevOps321"
      host = self.public_ip
    }
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/KVdineshkumar/roboshop-ansible main.yml -e env=dev -e role_name=${var.name}"

    ]
  }
}
resource "aws_route53_record" "www" {
  zone_id = "Z08427681QR9BSPPMJC53"
  name    = "${var.name}-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.private_ip]
}



data "aws_ami" "example" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = "Allow TLS inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}

variable "name" {}

