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

variable "rds_sg_ids" {
  type = list(string)
}