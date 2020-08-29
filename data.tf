data "aws_eks_cluster" "cluster" {
  name = module.demo-eks-cluster.cluster_id
}

data "aws_availability_zones" "available" {
}