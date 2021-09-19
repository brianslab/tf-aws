# networking/outputs.tf

output "aws_vpc" {
  value = aws_vpc.tf-aws_vpc.id
}

output "db_security_group" {
  value = [aws_security_group.tf-aws_sg["rds"].id]
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.tf-aws_subnetgroup.*.name
}

output "public_sg" {
  value = aws_security_group.tf-aws_sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.tf-aws_public_subnet.*.id
}