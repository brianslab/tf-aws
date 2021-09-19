# loadbalancer/main.tf

resource "aws_lb" "tf-aws_lb" {
  name            = "tf-aws-loadbalancer"
  subnets         = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout    = 400
}