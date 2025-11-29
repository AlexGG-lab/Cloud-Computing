# SQS NO se puede crear en este ambiente (rol awsstudent no tiene sqs:CreateQueue).
# Dejo aquí el código de ejemplo comentado para el repositorio del proyecto final.

# resource "aws_sqs_queue" "lab_results_dlq" {
#   name = "${var.project_name}-lab-results-dlq"
# }

# resource "aws_sqs_queue" "lab_results_queue" {
#   name                      = "${var.project_name}-lab-results-queue"
#   visibility_timeout_seconds = 60
#
#   redrive_policy = jsonencode({
#     deadLetterTargetArn = aws_sqs_queue.lab_results_dlq.arn
#     maxReceiveCount     = 5
#   })
# }
