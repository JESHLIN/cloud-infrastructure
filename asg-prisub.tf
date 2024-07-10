# Creating Security Group for ASG Launch Template
resource "aws_security_group" "launch-template-sg" {
  name   = var.launch_template_sg_name
  vpc_id = aws_vpc.terraform-vpc.id

  # Inbound Rules
  # HTTP access from anywhere
  inbound {
    from_port       = var.http_port
    to_port         = var.http_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-security-group.id]
  }

  # SSH access from anywhere
  inbound {
    from_port       = var.ssh_port
    to_port         = var.ssh_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-security-group.id]
  }

  # Outbound Rules
  # Internet access to anywhere
  outbound {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.lt_sg_outbound_cidr_blocks
  }
}