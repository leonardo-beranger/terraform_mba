module "network" {
  source = "./modulos/network"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_a_cidr = var.public_subnet_a_cidr
  public_subnet_b_cidr = var.public_subnet_b_cidr
  az_a                 = var.az_a
  az_b                 = var.az_b
}

module "security" {
  source = "./modulos/security"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  server_port  = var.server_port
}

module "load_balancer" {
  source = "./modulos/load_balancer"

  project_name          = var.project_name
  vpc_id                = module.network.vpc_id
  public_subnet_ids     = module.network.public_subnet_ids
  alb_security_group_id = module.security.alb_security_group_id
  server_port           = var.server_port
}

module "compute" {
  source = "./modulos/compute"

  project_name          = var.project_name
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  ec2_security_group_id = module.security.ec2_security_group_id
  user_data_file        = "${path.module}/userdata.sh"
}

module "autoscaling" {
  source = "./modulos/autoscaling"

  project_name       = var.project_name
  public_subnet_ids  = module.network.public_subnet_ids
  target_group_arn   = module.load_balancer.target_group_arn
  launch_template_id = module.compute.launch_template_id
  desired_capacity   = var.asg_desired_capacity
  min_size           = var.asg_min_size
  max_size           = var.asg_max_size
}

module "dns" {
  source = "./modulos/dns"
  count  = var.create_route53_record ? 1 : 0

  hosted_zone_id = var.hosted_zone_id
  record_name    = var.record_name
  alb_dns_name   = module.load_balancer.alb_dns_name
  alb_zone_id    = module.load_balancer.alb_zone_id
}