variable "lb_name" {
  type = string
}

variable "lb_type" {
  type = string
}


variable "lb_security_groups" {
  type = list(string)
}

variable "lb_subnets" {
  type = list(string)
}