aws_region           = "us-east-1"
project_name         = "terraform-mba"

vpc_cidr             = "10.0.0.0/16"
public_subnet_a_cidr = "10.0.1.0/24"
public_subnet_b_cidr = "10.0.2.0/24"

az_a                 = "us-east-1a"
az_b                 = "us-east-1b"

instance_type        = "t2.micro"
ami_id               = "ami-xxxxxxxxxxxxxxxxx"

server_port          = 80

asg_desired_capacity = 2
asg_min_size         = 2
asg_max_size         = 4

create_route53_record = false
hosted_zone_id        = ""
record_name           = ""