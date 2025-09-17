resource "aws_internet_gateway" "IGW" {
  vpc_id     = aws_vpc.eks_vpc.id
  depends_on = [aws_vpc.eks_vpc]
  tags = {
    Name = "main"
  }
}