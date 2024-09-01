output "network_self_link" {
  value       = google_compute_subnetwork.private.self_link
  description = "The self_link of the first private subnet"
}


output "subnet_self_link" {
  value = google_compute_network.vpc-network.self_link
  description = "The vpc network self link"
}

