resource "kubernetes_namespace" "gcp_api_infra_namespace" {
  metadata {
    name = var.namespace-name
  }
}

resource "kubernetes_deployment" "gcp_api_infa_deployment" {
  metadata {
    name      = "gcp-api-infra-deploy"
    namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.app-name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app-name
        }
      }

      spec {
        container {
          name  = var.container-name
          image = var.app-image

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
    name      = "gcp-api-infra-service"
    namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = var.app-name
    }

    port {
      port        = 80
      target_port = 80
    }

    type = var.service-type
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
            service_name = "gcp-api-infra-service"
            service_port = 80
          }
        }
      }
    }
  }

}
