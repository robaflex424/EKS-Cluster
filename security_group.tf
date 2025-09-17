resource "aws_security_group" "eks_nodes_sg" {
  name = "eks-nodes-sg"
  description = "Security Group for EKS nodes"
  vpc_id = aws_vpc.eks_vpc.id
}
resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.eks_nodes_sg.id
  cidr_ipv4 = var.all_ipv4
  ip_protocol = "-1"
}
resource "aws_vpc_security_group_ingress_rule" "allow_all_ingress" {
  security_group_id = aws_security_group.eks_nodes_sg.id
  cidr_ipv4 = var.all_ipv4
  ip_protocol = "-1"
}