########################################
# SECURITY GROUP PARA LA EC2 WORKER
########################################

resource "aws_security_group" "ec2_worker_sg" {
  name        = "${var.project_name}-ec2-worker-sg"
  description = "Allow SSH, HTTP, and outbound traffic"
  vpc_id      = aws_vpc.main.id

  # SSH desde cualquier IP (puedes restringirlo luego)
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP público
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Salida a Internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-worker-sg"
  }
}

########################################
# KEY PAIR
########################################

resource "aws_key_pair" "worker_key" {
  key_name   = "${var.project_name}-worker-key"
  public_key = file("${path.module}/worker_key.pub")

  lifecycle {
    create_before_destroy = true
  }
}


########################################
# INSTANCIA EC2  (DEBE SER SUBRED PÚBLICA)
########################################

resource "aws_instance" "worker" {
  ami                         = "ami-0e001c9271cf7f3b9"
  instance_type               = "t2.micro"

  # SUBRED PÚBLICA para SSH + PORTAL WEB
  subnet_id                   = aws_subnet.public_1.id

  # Debe tener IP pública
  associate_public_ip_address = true

  security_groups             = [aws_security_group.ec2_worker_sg.id]
  key_name                    = aws_key_pair.worker_key.key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y python3 git

    mkdir -p /opt/worker
    cd /opt/worker

    echo "print('Worker iniciado')" > worker.py
    nohup python3 worker.py > /var/log/worker.log 2>&1 &
  EOF

  tags = {
    Name = "${var.project_name}-ec2-worker"
  }
}

