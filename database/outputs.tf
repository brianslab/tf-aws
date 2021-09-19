# database/outputs.tf

output "db_endpoint" {
  value = aws_db_instance.tf-aws_db.endpoint
}