resource "aws_instance" "this_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name  	= var.key_name
  security_groups = [var.security_groups_name]
  subnet_id	    = var.subnet_id
} 