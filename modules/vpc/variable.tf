 variable "vpc_rrg" {
  description = "This ts the name of the vpc"
  type        = string
  default     = "vpc_rrg"
}

variable "vpc_cidr" {
  description = "This is the cidr value of VPC/Subnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "owner_name" {
  description = "This is the name of the owner"
  type        = string
  default     = "Roshan Raman Giri"
}

variable "az_name" {
  description = "This the the name of the AZ where the subnet is created"
  type        = string
  default     = "us-east-2a"
}

variable "az_name2" {
  description = "This is thename of the seconf AZ"
  type        = string
  default     = "us-east-2b"

}

variable "subnet_cidr" {
  description = "This is the cidr block for subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "ami_name" {
  description = "This is the ami that we are using, Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-03-25"
  type        = string
  default     = "ami-0a695f0d95cefc163"
}