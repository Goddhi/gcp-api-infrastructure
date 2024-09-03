resource "kubernetes_namespace" "gcp_api_infra_namespace" {
  metadata {
    name = var.gke_namespace_name
  }
}

resource "kubernetes_deployment" "gcp_api_infa_deployment" {
  metadata {
    name      = var.deployment_name
    namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.container_name
          image = var.app_image

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "gcp_api_infra_service" {
  metadata {
    name      = var.deployment_service_name
    namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = 80
      target_port = 80
    }

    type = var.deployment_service_type
  }
}

resource "kubernetes_ingress" "api_ingress" {
  metadata {
    name      = "api-ingress"
    namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
      "nginx.ingress.kubernetes.io/rewrite-target" : "/"
    }
  }

 spec {
    rule {
      http {
        path {
          path     = "/"
        #   path_type = "Prefix"
          backend {
            service_name = var.deployment_service_name
            service_port = 80
          }
        }
      }
    }
  }

}
