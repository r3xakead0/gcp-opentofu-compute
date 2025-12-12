locals {
  environment = "qa"
}

terraform {
  source = "../../"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  region           = "us-central1"
  zone             = "us-central1-b"
  network_name     = "web-${local.environment}"
  subnetwork_cidr  = "10.20.0.0/24"
  network_tags     = ["web", local.environment]
  firewall_sources = ["0.0.0.0/0"]
  instance_name    = "web-${local.environment}"
  machine_type     = "e2-small"
}
