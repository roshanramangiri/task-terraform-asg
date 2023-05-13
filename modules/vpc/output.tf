output "vpc_id" {
  value       = aws_vpc.vpc_rrg.id
  description = "This it the VPC id"
}

output "subnet_id" {
  value = aws_subnet.public_1.id
}

output "subnet_id2" {
  value = aws_subnet.public_2.id
}

output "sg" {
  value = aws_security_group.rrg_sg.id
}

output "private_subnet_id" {
  value = aws_subnet.private_1.id
}

output "private_subnet_id-2" {
  value = aws_subnet.private_2.id
}