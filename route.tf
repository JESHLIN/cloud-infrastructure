# Creates a public route table with a default route to the internet gateway
resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.terraform-vpc.id

  # Create a default route for the internet gateway with destination 0.0.0.0/0
  route {
    cidr_block = var.public_route_cidr
    gateway_id = aws_internet_gateway.terraform-internet-gateway.id
  }

  tags = {
    Name = var.public-route-name
  }
}

# Creates a private route table with a default route to the NAT gateway
resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = var.private_route_cidr
    gateway_id = aws_nat_gateway.terraform-nat-gateway.id
  }

  tags = {
    Name = var.private-route-name
  }
}

# Associates the public route table with the public subnet 1
resource "aws_route_table_association" "public-subnet1-route" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public-route.id
}

# Associates the public route table with the public subnet 2
resource "aws_route_table_association" "public-subnet2-route" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-route.id
}

# Associates the private route table with the private subnet 1
resource "aws_route_table_association" "private-subnet1-route" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.private-route.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.private-route]
}

# Associates the private route table with the private subnet 2
resource "aws_route_table_association" "private-subnet2-route" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private-route.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.private-route]
}
