resource "aws_lb" "test" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets
  enable_deletion_protection = true
} 