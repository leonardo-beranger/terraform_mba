resource "aws_launch_template" "this" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.ec2_security_group_id]

  user_data = base64encode(file(var.user_data_file))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-ec2"
    }
  }
}

output "launch_template_id" {
  description = "ID do launch template"
  value       = aws_launch_template.this.id
}