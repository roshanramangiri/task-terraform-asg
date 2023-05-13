output "alb_dns" {
    value = aws_alb.alb-rrg.dns_name
}

output "lb_id" {
    value = aws_alb.alb-rrg.id  
}

output "tg_arn" {
    value = aws_lb_target_group.rrg-tg.arn
}