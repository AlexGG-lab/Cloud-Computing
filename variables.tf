variable "aws_region" {
  description = "Región AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "healthcare-lab"
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el worker"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nombre del key pair de EC2 para SSH"
  type        = string
  default     = "healthcare-lab-worker-key"
}

variable "allowed_ssh_cidr" {
  description = "Rango CIDR desde donde podrás hacer SSH"
  type        = string
  default     = "0.0.0.0/0"
}

