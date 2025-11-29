provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.0"

  cluster_name    = "cost-optimized-eks"
  cluster_version = "1.29"

  vpc_id     = "your-vpc-here"
  subnet_ids = ["subnet-xxx", "subnet-yyy"]

  eks_managed_node_groups = {
    on_demand_nodes = {
      desired_size   = 1
      min_size       = 1
      max_size       = 1
      instance_types = ["t3.small"]
    }
  }
}

