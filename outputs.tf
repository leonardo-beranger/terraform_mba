output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = module.network.public_subnet_ids
}

output "alb_dns_name" {
  description = "DNS do load balancer"
  value       = module.load_balancer.alb_dns_name
}

output "target_group_arn" {
  description = "ARN do target group"
  value       = module.load_balancer.target_group_arn
}

output "launch_template_id" {
  description = "ID do launch template"
  value       = module.compute.launch_template_id
}

output "autoscaling_group_name" {
  description = "Nome do Auto Scaling Group"
  value       = module.autoscaling.autoscaling_group_name
}