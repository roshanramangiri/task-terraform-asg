variable "inst_type" {
    type = string
    default = "t2.micro"
}

variable "img_id" {
    type = string
    default = "ami-0a695f0d95cefc163"
}

variable "sg_id" {
    type = string
    default = ""  
}

variable "lb_id" {
    type = string
    default = ""  
}

variable "key_name" {
    type = string
    default = "rrg"  
}

variable "zone" {
  type = list
  default = []
}

variable "tg_arn" {
    
}