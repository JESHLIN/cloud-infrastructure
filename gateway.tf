# Create an internet gateway and associate it with the VPC
resource "aws_internet_gateway" "terraform-internet-gateway" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = var.internet-gateway-name
  }
}

# Create an Elastic IP address
resource "aws_eip" "nat-gateway-eip" {
  domain = "vpc"
}

# Create a NAT gateway and associate it with an Elastic IP and a public subnet
resource "aws_nat_gateway" "terraform-nat-gateway" {
  allocation_id = aws_eip.nat-gateway-eip.id     # Associate the NAT gateway with the Elastic IP
  subnet_id     = aws_subnet.public-sub1net.id # Associate the NAT gateway with a public subnet

  tags = {
    Name = var.nat-gateway-name
  }

  depends_on = [aws_internet_gateway.terraform-internet-gateway] # Make sure the internet gateway is created before creating the NAT gateway
}