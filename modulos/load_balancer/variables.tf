variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o target group sera criado"
  type        = string
}

variable "public_subnet_ids" {
  description = "Lista de subnets publicas onde o ALB sera criado"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ID do security group do ALB"
  type        = string
}

variable "server_port" {
  description = "Porta da aplicacao nas instancias"
  type        = number
}