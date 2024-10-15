variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "ci-cd-eks-cluster"
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS"
  type        = list(string)
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes in the EKS cluster"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Maximum number of worker nodes in the EKS cluster"
  type        = number
  default     = 3
}

variable "min_capacity" {
  description = "Minimum number of worker nodes in the EKS cluster"
  type        = number
  default     = 1
}

variable "monitoring_namespace" {
  description = "Namespace for Prometheus and Grafana in Kubernetes"
  type        = string
  default     = "monitoring"
}