variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone for the compute instance"
  type        = string
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
}

variable "network_self_link" {
  description = "Self link for the VPC network"
  type        = string
}

variable "subnetwork_self_link" {
  description = "Self link for the subnetwork"
  type        = string
}

variable "network_tags" {
  description = "Network tags for firewall targeting"
  type        = list(string)
}
