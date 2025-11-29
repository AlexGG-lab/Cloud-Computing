output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Subred pública"
  value       = aws_subnet.public_1.id
}

output "private_subnet_id" {
  description = "Subred privada"
  value       = aws_subnet.private_1.id
}

output "dynamodb_lab_results_table" {
  description = "Nombre de la tabla DynamoDB de resultados"
  value       = aws_dynamodb_table.lab_results.name
}

