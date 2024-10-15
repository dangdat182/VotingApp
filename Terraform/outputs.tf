output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "prometheus_grafana_status" {
  value = module.prometheus_grafana.status
}