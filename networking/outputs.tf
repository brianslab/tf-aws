# networking/outputs.tf

output "aws_vpc" {
  value = aws_vpc.brianslab_vpc.id
}