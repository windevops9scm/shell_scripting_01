resource "aws_security_group" "allow_ssh_per" {
  name                  = "allow_ssh_per"
  description           = "allow_ssh_per"

  ingress {
    description         = "SSH"
    from_port           = 22
    to_port             = 22
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]
  }

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
  }

  tags                  = {
    Name                = "allow_ssh_per"
  }
}

output "SG_ID" {
  value = aws_security_group.allow_ssh_per.id
}