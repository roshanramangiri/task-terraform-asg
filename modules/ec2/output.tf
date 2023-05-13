output "public_ip" {
  value = aws_instance.rrg_ec2.public_ip
}

output "instance_id" {
  value = aws_instance.rrg_ec2.id 
}

output "private_ip" {
  value = aws_instance.rrg_ec2.private_ip
}