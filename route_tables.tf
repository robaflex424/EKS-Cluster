resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route" "public_to_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.all_ipv4
  gateway_id             = aws_internet_gateway.IGW.id
}

resource "aws_route_table_association" "Public1" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnet1.id
}
resource "aws_route_table_association" "Public2" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnet2.id
}