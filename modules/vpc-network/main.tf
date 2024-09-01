resource "google_compute_network" "vpc-network" {
  name                    = format("%s-%s-%s", var.vpc-name, var.infrastructure_name, var.environment)
  auto_create_subnetworks = false

  description             = "VPC for ${var.vpc-name} in ${var.environment} environment of ${var.infrastructure_name} infrastructure "
  routing_mode            = var.routing_mode

  project                = var.project

}


resource "google_compute_subnetwork" "private" {
  name                = format("%s-%s", var.private-subnet-name, var.infrastructure_name)
  ip_cidr_range       = var.ip_cidr_range
  region              = var.region
  network             = google_compute_network.vpc-network.self_link
  private_ip_google_access = true


}
