variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde os security groups serão criados"
  type        = string
}

variable "server_port" {
  description = "Porta usada pela aplicação nas instâncias"
  type        = number
}