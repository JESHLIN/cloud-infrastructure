# Output
output "vpc-id" {
  value = aws_vpc.terraform-vpc.id
}

output "public-subnet1-id" {
  value = aws_subnet.public-subnet1.id
}

output "public-subnet2-id" {
  value = aws_subnet.public-subnet2.id
}

output "private-subnet1-id" {
  value = aws_subnet.private-subnet1.id
}

output "private-subnet2-id" {
  value = aws_subnet.private-subnet2.id
}

output "terraform-internet-gateway" {
  value = aws_internet_gateway.terraform-internet-gateway.id
}

output "alb-dns" {
  value = aws_lb.public-subnet-alb.dns_name
}