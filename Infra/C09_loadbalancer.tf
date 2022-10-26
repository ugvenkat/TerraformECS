resource "aws_lb" "main" {
  name            = "my-alb"
  security_groups = [aws_security_group.main.id]
  subnets = [
    aws_subnet.public_d.id,
    aws_subnet.public_e.id,
  ]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn  
  port = 80
  protocol = "HTTP"  
  default_action {
    type = "fixed-response"    
	fixed_response {
      content_type = "text/plain"
      message_body = "Main ALB is live now."
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "main" {
  name_prefix = "my-alb"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.app_vpc.id
}

resource "aws_lb_listener_rule" "main" {
  listener_arn = aws_lb_listener.http.arn  
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }  
  condition {
    path_pattern {
      values = ["/WeatherForecast*"]
    }
  }
}