variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "vpc_name" {
  default = "my-vpc"
  type    = string
}

variable "availability_zone-1" {
  default = "us-east-1a"
  type    = string
}

variable "availability_zone-2" {
  default = "us-east-1b"
  type    = string
}

variable "auto-assign-ip" {
  default = "true"
  type    = bool
}

variable "public-subnet1-name" {
  default = "Public-Subnet 1"
  type    = string
}

variable "public-subnet2-name" {
  default = "Public-Subnet 2"
  type    = string
}

variable "private-subnet1-name" {
  default = "Private-Subnet 1"
  type    = string
}

variable "private-subnet2-name" {
  default = "Private-Subnet 2"
  type    = string
}

variable "internet-gateway-name" {
  default = "Internet-Gateway"
  type    = string
}

variable "nat-gateway-name" {
  default = "Nat-Gateway"
  type    = string
}

variable "public-route-name" {
  default = "Public-Route-Table"
  type    = string
}

variable "private-route-name" {
  default = "Private-Route-Table"
  type    = string
}

variable "vpc-cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "alb_security_group_name" {
  type        = string
  description = "Name of the App Load Balancer security group"
  default     = "alb-security-group"
}

variable "alb_security_group_description" {
  type        = string
  description = "Description of the App Load Balancer security group"
  default     = "ALB-Security-Group"
}

variable "http_port" {
  type        = number
  description = "Port for HTTP traffic"
  default     = 80
}

variable "ssh_port" {
  type        = number
  description = "Port for SSH traffic"
  default     = 22
}

variable "alb_sg_inbound_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow inbound traffic to the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

variable "alb_sg_outbound_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

variable "load_balancer_name" {
  type        = string
  description = "Name of the load balancer"
  default     = "pub-sub-alb"
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group"
  default     = "alb-tg"
}

variable "launch-template_sg_name" {
  type        = string
  description = "Name of the ASG security group"
  default     = "Security Group for ASG"
}

variable "launch-template_sg_outbound_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the ASG security group"
  default     = ["0.0.0.0/0"]
}

variable "asg_name" {
  type        = string
  description = "Name of the ASG "
  default     = "ASG"
}

variable "launch-template_asg_name" {
  type        = string
  description = "Name of the Launch Template "
  default     = "lt-asg"
}

variable "launch-template_asg_ami" {
  type        = string
  description = "Amazon Linux 2 Ami ID"
  default     = "ami-04581fbf744a7d11f"
}

variable "launch-template_asg_instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
}

variable "launch-template_asg_key" {
  type        = string
  description = "Key Pair"
  default     = "ssh_server"
}

variable "asg_min" {
  type        = number
  description = "ASG Min Size"
  default     = 2
}

variable "asg_max" {
  type        = number
  description = "ASG Max Size"
  default     = 5
}

variable "asg_des_cap" {
  type        = number
  description = "ASG Desired Capacity"
  default     = 2
}


variable "public_route_cidr" {
  type        = string
  description = "CIDR block to route taffic from internet gateway to anywhere"
  default     = "0.0.0.0/0"
}

variable "private_route_cidr" {
  type        = string
  description = "CIDR block to route taffic from private subnet to natgateway"
  default     = "0.0.0.0/0"
}


variable "public_subnet1_cidr" {
  default = "10.0.1.0/24"
  type    = string
}

variable "public_subnet2_cidr" {
  default = "10.0.2.0/24"
  type    = string
}

variable "private_subnet1_cidr" {
  default = "10.0.3.0/24"
  type    = string
}

variable "private_subnet2_cidr" {
  default = "10.0.4.0/24"
  type    = string
}
