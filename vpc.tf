resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "EKS-VPC"
  }
  enable_dns_hostnames = true
  enable_dns_support = true
}