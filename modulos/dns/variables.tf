variable "hosted_zone_id" {
  description = "ID da hosted zone do Route 53"
  type        = string
}

variable "record_name" {
  description = "Nome do registro DNS"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS do Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID do ALB"
  type        = string
}