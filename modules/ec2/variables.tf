variable "sg_id" {
  type        = string
  description = "Security Groups"
}

# variable "db_sg_rrg" {
#   type = string
# }

variable "vpc_idr" {
  type        = string
  description = "VPC where we will deploy ec2"
}

variable "ami_id" {
  type        = string
  default     = "ami-06c4532923d4ba1ec"
  description = "AMI ID which is used to create a instance"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of EC2 instance"
}

variable "public_subnet_id" {
  type        = string
  description = "Subnet Id where our EC2 is launched"

}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A map of tags to add all resources"
}
