resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  description = "Security group do Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "Permite HTTP de qualquer origem para o ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Permite saida para qualquer destino"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "Security group das instancias EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Permite trafego da aplicacao somente a partir do ALB"
    from_port       = var.server_port
    to_port         = var.server_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    description = "Permite saida para qualquer destino"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}

output "alb_security_group_id" {
  description = "ID do security group do ALB"
  value       = aws_security_group.alb.id
}

output "ec2_security_group_id" {
  description = "ID do security group das instancias EC2"
  value       = aws_security_group.ec2.id
}