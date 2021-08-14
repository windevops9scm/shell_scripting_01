//resource "aws_instance" "instances" {
//  ami              = "ami-074df373d6bafa625"
//  instance_type    = "t2.micro"
//}

resource "aws_spot_instance_request" "cheap_worker" {
  count                = length(var.COMPONENTS)
  ami                  = "ami-074df373d6bafa625"
  spot_price           = "0.0031"
  instance_type        = "t3.micro"
  wait_for_fulfillment = true

  tags                 = {
    Name               = element(var.COMPONENTS,count.index )
  }
}

//resource "aws_ec2_tag" "name-tag" {
//  count                 = length(var.COMPONENTS)
//  resource_id           = aws_spot_instance_request.cheap_worker.*.spot_instance_id
//  key                   = "Name"
//  value                 = element(var.COMPONENTS,count.index )
//}

output "attributes" {
  value           = aws_spot_instance_request.cheap_worker.*.spot_instance_id
}