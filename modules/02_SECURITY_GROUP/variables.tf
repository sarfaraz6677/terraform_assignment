
variable "sg_name" {
    type = string
  }

variable "sg_ports" {
  type = list(any)
}

variable "vpc_id" {
     type = string
} 