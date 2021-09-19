# loadbalancer/outputs.tf

output "lb_target_group_arn" {
  value = aws_lb_target_group.tf-aws_tg.arn
}

output "lb_endpoint" {
  value = aws_lb.tf-aws_lb.dns_name
}