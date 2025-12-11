output "instance_external_ip" {
  description = "External IP of the web server"
  value       = google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip
}

output "instance_self_link" {
  description = "Self link for the compute instance"
  value       = google_compute_instance.web_server.self_link
}
