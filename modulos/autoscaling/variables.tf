variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "public_subnet_ids" {
  description = "Lista de subnets onde o ASG sera criado"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN do target group do ALB"
  type        = string
}

variable "launch_template_id" {
  description = "ID do launch template"
  type        = string
}

variable "desired_capacity" {
  description = "Quantidade desejada de instancias"
  type        = number
}

variable "min_size" {
  description = "Quantidade minima de instancias"
  type        = number
}

variable "max_size" {
  description = "Quantidade maxima de instancias"
  type        = number
}