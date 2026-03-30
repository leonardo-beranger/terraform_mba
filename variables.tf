variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "terraform_mba"
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "Bloco CIDR da subnet pública A"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "Bloco CIDR da subnet pública B"
  type        = string
}

variable "az_a" {
  description = "Zona de disponibilidade A"
  type        = string
}

variable "az_b" {
  description = "Zona de disponibilidade B"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "ami_id" {
  description = "AMI utilizada nas instâncias"
  type        = string
}

variable "server_port" {
  description = "Porta do servidor web"
  type        = number
  default     = 80
}

variable "asg_desired_capacity" {
  description = "Quantidade desejada de instâncias"
  type        = number
}

variable "asg_min_size" {
  description = "Quantidade mínima de instâncias"
  type        = number
}

variable "asg_max_size" {
  description = "Quantidade máxima de instâncias"
  type        = number
}

variable "create_route53_record" {
  description = "Define se o registro Route 53 será criado"
  type        = bool
  default     = false
}

variable "hosted_zone_id" {
  description = "ID da hosted zone do Route 53"
  type        = string
  default     = ""
}

variable "record_name" {
  description = "Nome do registro DNS"
  type        = string
  default     = ""
}