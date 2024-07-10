# Create security group for ALB
resource "aws_security_group" "alb-security-group" {
  # Set name and description of the security group
  name        = var.alb_security_group_name
  description = var.alb_security_group_description

  # Set the VPC ID where the security group will be created
  vpc_id     = aws_vpc.terraform-vpc.id
  depends_on = [aws_vpc.terraform-vpc]

  # Inbound Rule
  # HTTP access from anywhere
  inbound {
    description = "Allow HTTP Traffic"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.alb_security_group_inbound_cidr_blocks
  }

  # SSH access from anywhere
  inbound {
    description = "Allow SSH Traffic"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.alb_security_group_inbound_cidr_blocks
  }

  # Outbound Rule
  # Allow all egress traffic
  outbound {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = var.alb_security_group_outbound_cidr_blocks
  }

  # Set tags for the security group
  tags = {
    Name = "ALB Security Group"
  }
}

# Create a new load balancer
resource "aws_lb" "public-subnet-alb" {
  name            = var.load_balancer_name
  subnets         = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]
  security_groups = [aws_security_group.alb-security-group.id]

  tags = {
    Name = "ALB-Public-subnet"
  }
}

# Create a target group for the load balancer
resource "aws_lb_target_group" "alb-target-group" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.terraform-vpc.id

  # Set the health check configuration for the target group
  health_check {
    interval = 60
    path     = "/"
    port     = 80
    timeout  = 45
    protocol = "HTTP"
    matcher  = "200,202"
  }
}


# Create ALB listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.public-subnet-alb.arn
  port              = "80"
  protocol          = "HTTP"

  # Set the default action for the listener
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }
}