module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.24.1" # Check for latest version

  cluster_name    = var.cluster_name
  cluster_version = "1.22"
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity
      instance_type    = var.node_instance_type
      key_name         = var.key_name  # Specify the EC2 key pair name
    }
  }

  tags = {
    Name = var.cluster_name
  }
}


