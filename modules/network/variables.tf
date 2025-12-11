variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for the subnetwork"
  type        = string
}

variable "network_name" {
  description = "Name for the VPC network"
  type        = string
}

variable "subnetwork_cidr" {
  description = "CIDR range for the subnetwork"
  type        = string
}

variable "network_tags" {
  description = "Network tags to target in firewall rules"
  type        = list(string)
}

variable "firewall_sources" {
  description = "Source CIDR ranges allowed through firewall"
  type        = list(string)
}
