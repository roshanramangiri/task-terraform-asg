# output "rds_endpoint" {
#   value = module.rds.endpoint_rds
# }

# output "Instance_IP" {
#   value = module.ec2.public_ip
# }

output "alb_dns" {
  value = module.alb.alb_dns
}