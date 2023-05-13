#Create a load balancer
resource "aws_alb" "alb-rrg" {
  name               = "alb-rrg"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.rrg_sg_id]
  subnets            = [var.public_subnet_1, var.public_subnet_2]
  tags = {
    Name = "alb-rrg"
    User = "Roshan Raman Giri"
  }
}

#Create a target group for load balancer
resource "aws_lb_target_group" "rrg-tg" {
  name        = "rrg-tg"
  # target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id_rrg
  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    matcher             = 200
    path                = "/"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# #Create target group attachment 
# resource "aws_lb_target_group_attachment" "rrg_attachment" {
#     target_group_arn = aws_lb_target_group.rrg-tg.arn
#     target_id = var.instance_id
# }

#Create listner for Load Balancer
resource "aws_lb_listener" "alb_listner_rrg" {
  load_balancer_arn = aws_alb.alb-rrg.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rrg-tg.arn
  }

}