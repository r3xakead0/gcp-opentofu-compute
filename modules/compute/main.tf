resource "google_compute_instance" "web_server" {
  name         = var.instance_name
  project      = var.project_id
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.network_tags

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-13"
    }
  }

  network_interface {
    network    = var.network_self_link
    subnetwork = var.subnetwork_self_link

    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/usr/bin/env bash
    set -euo pipefail

    apt-get update
    apt-get install -y nginx

    cat >/var/www/html/index.nginx-debian.html <<'PAGE'
    <html>
      <head>
        <title>Opentofu Web Server</title>
      </head>
      <body>
        <h1>Hello from Opentofu on GCP!</h1>
      </body>
    </html>
    PAGE

    systemctl enable nginx
    systemctl restart nginx
  EOT
}
