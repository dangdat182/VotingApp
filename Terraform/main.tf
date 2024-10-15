provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.eks_auth.token
}

# Data source for EKS cluster authentication
data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.cluster_name
}

# EKS Cluster Module
module "eks" {
  source = "./modules/eks-cluster"

  cluster_name       = var.cluster_name
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  node_instance_type = var.node_instance_type
  desired_capacity   = var.desired_capacity
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
}

# Prometheus and Grafana Module
module "prometheus_grafana" {
  source = "./modules/prometheus-grafana"

  cluster_name = module.eks.cluster_name
  namespace    = var.monitoring_namespace
}


