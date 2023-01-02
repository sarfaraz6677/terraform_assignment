resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


resource "aws_db_instance" "this_rds " {
  engine               = "mysql"
  engine_version       = "5.7"
  password             = random_password.password.result
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  allocated_storage    = var.rds_storage_size
  identifier           = var.rds_name
  instance_class       = var.rds_type
  username             = var.username
  vpc_security_group_ids = var.rds_sg_ids
  
}