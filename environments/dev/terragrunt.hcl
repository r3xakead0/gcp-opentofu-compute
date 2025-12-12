locals {
  environment = "dev"
}

terraform {
  source = "../../"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  region           = "us-central1"
  zone             = "us-central1-a"
  network_name     = "web-${local.environment}"
  subnetwork_cidr  = "10.10.0.0/24"
  network_tags     = ["web", local.environment]
  firewall_sources = ["0.0.0.0/0"]
  instance_name    = "web-${local.environment}"
  machine_type     = "e2-micro"
}
