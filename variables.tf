variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone for compute resources"
  type        = string
  default     = "us-central1-a"
}

variable "network_name" {
  description = "Name for the VPC network"
  type        = string
  default     = "web-network"
}

variable "subnetwork_cidr" {
  description = "CIDR range for the subnetwork"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_tags" {
  description = "Network tags applied to instances"
  type        = list(string)
  default     = ["web"]
}

variable "firewall_sources" {
  description = "Source CIDR blocks allowed by firewall rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "web-server"
}

variable "machine_type" {
  description = "Machine type for the web server"
  type        = string
  default     = "e2-micro"
}
