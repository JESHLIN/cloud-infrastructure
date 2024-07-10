# Create an AWS VPC
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# Create first public subnet in the VPC
resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.public-subnet1-name
  }
}

# Create second public subnet in the VPC
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.public-subnet2-name
  }
}

# Create first private subnet in the VPC
resource "aws_subnet" "private-subnet1" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.private_subnet1_cidr
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.private-subnet1-name
  }
}

# Create second private subnet in the VPC
resource "aws_subnet" "priv-sub2" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.priv_sub2_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private-subnet2-name
  }
}
