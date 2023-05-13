output "db_sg_rrg" {
  value = aws_security_group.rds_security_group.id
}

output "endpoint_rds" {
  value = aws_db_instance.rrg_db.endpoint
}
