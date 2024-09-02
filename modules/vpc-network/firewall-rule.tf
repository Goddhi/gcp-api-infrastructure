
# resource "google_compute_firewall" "allow_ssh" {
#   name    = "allow-ssh"
#   network = google_compute_network.vpc_network.self_link

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }




resource "google_compute_firewall" "allow_internal" {
  name    = format("%s-%s", var.internal-firewall-rule-name, var.infrastructure_name)
  network = google_compute_network.vpc-network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }
  
  source_ranges = var.internal_source_ranges
}

