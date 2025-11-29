########################################
# S3 BUCKET PARA RESULTADOS DE LAB
# NOTA:
#   Este bucket fue creado originalmente con Terraform
#   (antes de que se aplicaran restricciones nuevas en la cuenta).
#
#   Después de creado, por limitaciones del usuario "awsstudent"
#   (deny explícito a s3:GetBucketObjectLockConfiguration),
#   Terraform ya no puede leer/gestionar el bucket sin fallar.
#
#   Por eso usamos count = 0: la definición queda en el código
#   para fines del proyecto, pero Terraform ya no intenta tocar
#   el recurso en esta cuenta de laboratorio.
########################################

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "aws_s3_bucket" "lab_results" {
  # IMPORTANTE:
  # Este resource se usó originalmente sin "count"
  # para crear buckets como:
  #   healthcare-lab-lab-results-xqcn0m
  #
  # Después de creado el bucket, se puso count = 0
  # para que Terraform ya no haga llamadas a S3
  # (que ahora fallan por permisos).

  count = 0

  bucket = "${var.project_name}-lab-results-${random_string.suffix.id}"

  tags = {
    Name = "${var.project_name}-lab-results"
  }
}
