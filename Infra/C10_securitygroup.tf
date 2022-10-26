resource "aws_security_group" "main" {
  name = "${var.name}-securitygrp-${var.environment}"
  vpc_id = aws_vpc.app_vpc.id 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}