# resource "google_container_cluster" "primary" {
#   name               = format("%s-%s", var.cluster_name, var.infrastructure_name)
#   location           = var.region
#   initial_node_count = 1

#   network    = var.vpc-name
#   subnetwork = var.private-subnet-name

#   node_config {
#     machine_type = var.machine_type
    # service_account = var.gke_service_account_email

#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform",
#     ]
    
#   }

#   remove_default_node_pool = true
#   node_locations           = [var.zone]
# }

  # node_pool {

  # }
  # # Node pool configuration
  # node_config {
  #   machine_type = "e2-medium"
  #   oauth_scopes = [
  #     "https://www.googleapis.com/auth/cloud-platform"
  #   ]
  #   disk_size_gb = 100
  #   preemptible  = false



  #   shielded_instance_config {
  #     enable_secure_boot          = true
  #     enable_integrity_monitoring = true
  #   }
  # }

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)

}


resource "google_container_cluster" "primary" {
  name     = format("%s-%s", var.cluster_name, var.infrastructure_name)
  location = var.zone
  remove_default_node_pool = true
  initial_node_count    = 1 



  # Networking
  network    = var.vpc-name
  subnetwork = var.private-subnet-name

  # Enable private cluster
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

master_authorized_networks_config {
  cidr_blocks {
    cidr_block   = var.authorized-net-cidr  
    display_name = var.authorized-net-name
  }
}


  # IP allocation for Pods and Services
  ip_allocation_policy {
    cluster_secondary_range_name  = var.secondary_ip_range_pods_name
    services_secondary_range_name = var.secondary_ip_range_services_name
  }
    deletion_protection = false

  #     depends_on = [
  #   var.vpc-name
  # ]
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.node-pool-name
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  node_count = 1


  node_config {
    machine_type = var.machine_type
    service_account = var.gke_service_account_email
    tags = [var.node-pool-name, var.infrastructure_name]
    disk_type       = var.disk_type
    disk_size_gb    = var.disk_size_gb

    
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

    autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
}

