variable "project_name" {
  description = "Nome do projeto"
  type        = string
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