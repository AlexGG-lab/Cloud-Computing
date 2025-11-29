# Tabla DynamoDB para resultados procesados
resource "aws_dynamodb_table" "lab_results" {
  name         = "${var.project_name}-lab-results"
  billing_mode = "PAY_PER_REQUEST" # ideal para estudiante: sin capacidad fija

  hash_key  = "result_id"
  range_key = "patient_id"

  attribute {
    name = "result_id"
    type = "S"
  }

  attribute {
    name = "patient_id"
    type = "S"
  }

  tags = {
    Name = "${var.project_name}-lab-results-table"
  }
}
