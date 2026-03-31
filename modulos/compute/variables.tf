variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "ami_id" {
  description = "AMI utilizada nas instancias"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
}

variable "ec2_security_group_id" {
  description = "ID do security group das instancias EC2"
  type        = string
}

variable "user_data_file" {
  description = "Caminho do arquivo user_data"
  type        = string
}