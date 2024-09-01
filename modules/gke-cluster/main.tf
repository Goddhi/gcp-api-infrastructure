resource "google_container_cluster" "primary" {
  name               = format("%s-%s", var.cluster_name, var.infrastructure_name)
  location           = var.region
  initial_node_count = 1

  network    = var.vpc-name
  subnetwork = var.private-subnet-name

  node_config {
    machine_type = var.machine_type
    service_account = var.gke_service_account_email

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  remove_default_node_pool = true
  node_locations           = [var.zone]
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.node-pool-name
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 1

  node_config {
    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}


