module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      name           = "default-ng"
      instance_types = ["t3.medium"]
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
    }
  }

  cluster_addons = {
    coredns    = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni    = { most_recent = true }
  }

  tags = {
    Name        = var.cluster_name
    Environment = var.name
  }
}
