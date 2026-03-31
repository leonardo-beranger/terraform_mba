resource "aws_autoscaling_group" "this" {
  name                = "${var.project_name}-asg"
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = var.public_subnet_ids
  target_group_arns   = [var.target_group_arn]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 120

  tag {
    key                 = "Name"
    value               = "${var.project_name}-asg-instance"
    propagate_at_launch = true
  }
}

output "autoscaling_group_name" {
  description = "Nome do Auto Scaling Group"
  value       = aws_autoscaling_group.this.name
}