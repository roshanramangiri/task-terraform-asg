#Create VPC
resource "aws_vpc" "vpc_rrg" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default" #or can be dedicated, default is "default"
  enable_dns_support   = true      #default is true
  enable_dns_hostnames = true      #default is false
  tags = {
    Name  = "vpc_rrg"
    Owner = var.owner_name
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "vpc_rrg_igw" {
  vpc_id = aws_vpc.vpc_rrg.id
  tags = {
    Owner = var.owner_name
  }
}

#Create a Public Subnet
resource "aws_subnet" "public_1" {
  availability_zone       = var.az_name
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true #this assigns public ip to the instance created inside the subnet
  vpc_id                  = aws_vpc.vpc_rrg.id
  tags = {
    Name  = "public_subnet_1"
    Owner = var.owner_name
  }
}

#Create another Public Subnet
resource "aws_subnet" "public_2" {
  availability_zone       = var.az_name2
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true #this assigns public ip to the instance created inside the subnet
  vpc_id                  = aws_vpc.vpc_rrg.id
  tags = {
    Name  = "public_subnet_1"
    Owner = var.owner_name
  }
}

#Create a private  Subnet
resource "aws_subnet" "private_1" {
  availability_zone       = var.az_name2
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false #this assigns public ip to the instance created inside the subnet
  vpc_id                  = aws_vpc.vpc_rrg.id
  tags = {
    Name  = "private_subnet_1"
    Owner = var.owner_name
  }
}

#Create another private  Subnet
resource "aws_subnet" "private_2" {
  availability_zone       = var.az_name
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false #this assigns public ip to the instance created inside the subnet
  vpc_id                  = aws_vpc.vpc_rrg.id
  tags = {
    Name  = "private_subnet_1"
    Owner = var.owner_name
  }
}


#Create routetable for public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_rrg.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_rrg_igw.id
  }

  tags = {
    Name  = "public-rt"
    Owner = var.owner_name
  }
}

#Assigning subnets to the public route table
resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rt.id
}
#Assigning subnets to the public route table
resource "aws_route_table_association" "public_rt_asso2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rt.id
}


#Create a security group
resource "aws_security_group" "rrg_sg" {
  name        = "rrg_sg"
  description = "This is a security group containing inbound permissioin for ssh, http and https from anywhere"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }

  vpc_id = aws_vpc.vpc_rrg.id

  tags = {
    Name  = "rrg_sg"
    Owner = var.owner_name
  }
}
