provider "helm" {
  kubernetes {
    host                   = var.k8s_host
    cluster_ca_certificate = var.k8s_cluster_ca
    token                  = var.k8s_token
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "prometheus-community/kube-prometheus-stack"
  namespace  = var.namespace
  repository = "https://prometheus-community.github.io/helm-charts"

  set {
    name  = "prometheus.service.type"
    value = "LoadBalancer"
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana/grafana"
  namespace  = var.namespace
  repository = "https://grafana.github.io/helm-charts"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

