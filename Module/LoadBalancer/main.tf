resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false #Public facing
  load_balancer_type = "application"
  security_groups    = [var.HTTPandSSH]
  subnets            = [var.subnet1, var.subnet2]

}

resource "aws_lb_target_group" "TG" {
  name     = "targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.VPC

  health_check {
    path = "/"
    port = "traffic-port"
  }

}

resource "aws_lb_target_group_attachment" "TGA1" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id = var.webserver1
  port = 80
}

resource "aws_lb_target_group_attachment" "TGA2" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id = var.webserver2
  port = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
}