resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.public_subnets_ipv4_cidr1
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.eks_vpc]
  tags = {
    Name = "Public Subnet 1"
  }
  availability_zone = var.az_id[0]
}
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.public_subnets_ipv4_cidr2
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.eks_vpc]
  tags = {
    Name = "Public Subnet 2"
  }
  availability_zone = var.az_id[1]
}

