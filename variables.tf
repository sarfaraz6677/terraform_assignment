# 01_VPC

variable "cidr_block" {
  type = string
}
variable "public_subnet_cidr" {
  type = list(string)
}
variable "private_subnet_cidr" {
  type = list(string)
}
variable "availability_zone" {
  type = list(string)
}



#02_ASG

variable "alb_sg_name" {
    type = string
  }

variable "alb_sg_ports" {
  type = list(any)
}


variable "web_sg_name" {
    type = string
  }

variable "web_sg_ports" {
  type = list(any)
}

# app

variable "app_sg_name" {
    type = string
  }

variable "app_sg_ports" {
  type = list(any)
}

# rds

variable "rds_sg_name" {
    type = string
  }

variable "rds_sg_ports" {
  type = list(any)
}


#ALB

variable "lb_name" {
  type = string
}

variable "lb_type" {
  type = string
}

# EC2

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}




variable "ssh_key_name" {
  type = string
}
variable "ssh_key_path" {
  type = string
}


#RDS

variable "rds_storage_size" {
  type = number
}

variable "rds_name" {
  type = string
}

variable "rds_type" {
  type = string
}

variable "username" {
  type = string
}

#S3

variable "bucket_name" {
  type = string
}