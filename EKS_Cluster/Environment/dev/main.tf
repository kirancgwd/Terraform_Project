provider "aws" {
  region = var.region
}

module "vpc" {
  source              = "../../modules/vpc"
  name                = "eks-vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  azs                 = ["us-west-2a", "us-west-2b"]
}

module "iam" {
  source = "../../modules/iam"
  name   = "eks-iamrole"
}

module "security_group" {
  source = "../../modules/security_group"
  name   = "eks-sg"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source          = "../../modules/eks"
  name            = "kirancgwd-eks"
  cluster_name    = "kirancgwd-eks"
  cluster_version = "1.27"
  subnet_ids      = module.vpc.public_subnet_ids
  vpc_id          = module.vpc.vpc_id
}
