
resource "aws_eks_cluster" "eks" {
  name = "my-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  vpc_config {
    subnet_ids = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
  }
  depends_on = [ aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy ]
}

resource "aws_eks_node_group" "node_group" {
  cluster_name = aws_eks_cluster.eks.name
  node_group_name = "eks_nodes"
  node_role_arn = aws_iam_role.eks_node_role.arn
  subnet_ids = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
  scaling_config {
    desired_size = 8
    max_size = 10
    min_size = 4
  }
  instance_types = ["t2.micro"]
  depends_on = [ aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
                 aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
                 aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy
                ]    
}
