output "network_self_link" {
  description = "Self link for the VPC network"
  value       = google_compute_network.vpc.self_link
}

output "subnetwork_self_link" {
  description = "Self link for the subnetwork"
  value       = google_compute_subnetwork.subnet.self_link
}
