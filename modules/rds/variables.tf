variable "rrg_username" {
  type      = string
  sensitive = true
}

variable "rrg_password" {
  type      = string
  sensitive = true
}

variable "sg_id" {
  type    = string
  default = ""
}

variable "vpc_id_rrg" {
  type    = string
  default = ""
}

variable "private_subnet_id_rrg_1" {
  type    = string
  default = ""
}

variable "private_subnet_id_rrg_2" {
  type    = string
  default = ""
}