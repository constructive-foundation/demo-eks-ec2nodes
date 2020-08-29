
module "demo-eks-cluster" {
  source          = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git?ref=v12.2.0"
  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_ver
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.worker_nodes_desired
      max_capacity     = var.worker_nodes_max
      min_capaicty     = var.worker_nodes_min

      instance_type = var.worker_instance_type
    }
  }
}