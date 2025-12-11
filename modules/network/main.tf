resource "google_compute_network" "vpc" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.network_name}-subnet"
  project       = var.project_id
  ip_cidr_range = var.subnetwork_cidr
  region        = var.region
  network       = google_compute_network.vpc.self_link
}

resource "google_compute_firewall" "allow_web" {
  name    = "${var.network_name}-allow-web"
  project = var.project_id
  network = google_compute_network.vpc.name

  direction     = "INGRESS"
  target_tags   = var.network_tags
  source_ranges = var.firewall_sources

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }
}
