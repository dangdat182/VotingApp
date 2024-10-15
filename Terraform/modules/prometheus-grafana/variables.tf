variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "namespace" {
  description = "Namespace for Prometheus and Grafana"
  type        = string
  default     = "monitoring"
}

variable "k8s_host" {
  description = "Kubernetes cluster endpoint"
  type        = string
}

variable "k8s_cluster_ca" {
  description = "Kubernetes cluster certificate authority data"
  type        = string
}

variable "k8s_token" {
  description = "Kubernetes access token"
  type        = string
}
