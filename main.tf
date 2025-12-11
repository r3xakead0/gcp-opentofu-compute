provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "network" {
  source           = "./modules/network"
  project_id       = var.project_id
  region           = var.region
  network_name     = var.network_name
  subnetwork_cidr  = var.subnetwork_cidr
  network_tags     = var.network_tags
  firewall_sources = var.firewall_sources
}

module "compute" {
  source               = "./modules/compute"
  project_id           = var.project_id
  region               = var.region
  zone                 = var.zone
  instance_name        = var.instance_name
  machine_type         = var.machine_type
  network_self_link    = module.network.network_self_link
  subnetwork_self_link = module.network.subnetwork_self_link
  network_tags         = var.network_tags
}
