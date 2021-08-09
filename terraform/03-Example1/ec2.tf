resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "ssh"


  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_ssh"
  }
}
output "sg_attributes" {
  value = aws_security_group.allow_ssh
}
provider "aws" {
  region = "us-east-1"
}