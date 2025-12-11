output "network_self_link" {
  description = "Self link for the VPC network"
  value       = module.network.network_self_link
}

output "subnetwork_self_link" {
  description = "Self link for the subnetwork"
  value       = module.network.subnetwork_self_link
}

output "instance_external_ip" {
  description = "External IP address of the web server"
  value       = module.compute.instance_external_ip
}

output "instance_self_link" {
  description = "Self link for the compute instance"
  value       = module.compute.instance_self_link
}
