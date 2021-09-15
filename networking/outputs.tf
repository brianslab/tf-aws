# networking/outputs.tf

output "aws_vpc" {
  value = aws_vpc.tf-aws_vpc.id
}