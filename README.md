# GCP OpenTofu Compute

Infrastructure-as-code example that provisions a small web stack on Google Cloud Platform using OpenTofu. It creates a VPC, subnetwork, firewall to allow SSH/HTTP, and a Debian 13 compute instance that auto-installs NGINX and serves a simple page.

## Requirements
- OpenTofu `>= 1.10.0`
- `gcloud` CLI with Application Default Credentials (`gcloud auth application-default login`) or a `GOOGLE_APPLICATION_CREDENTIALS` service account key
- GCP project with billing enabled
- GCS bucket for remote state (the `gcs` backend is defined in `versions.tf`)
- Permissions: ability to create compute and network resources (e.g., Compute Admin + Compute Network Admin) and write to the state bucket

## Installation / Setup
1. Clone the repo and switch into it:
   ```bash
   git clone <repo-url> gcp-opentofu-compute
   cd gcp-opentofu-compute
   ```
2. Create a state bucket if you do not have one yet:
   ```bash
   gsutil mb -p <PROJECT_ID> gs://<STATE_BUCKET>
   ```
3. Configure authentication (one option):
   ```bash
   gcloud auth application-default login
   ```
4. Update `terraform.tfvars` (or your own tfvars file) with project details and any overrides. Key inputs:
   - `project_id`: target GCP project
   - `region` / `zone`: deployment location (defaults to `us-central1` / `us-central1-a`)
   - `network_name`, `subnetwork_cidr`, `network_tags`, `firewall_sources`
   - `instance_name`, `machine_type`

## Usage
Initialize with your state bucket (add `prefix=` if desired):
```bash
opentofu init -backend-config="bucket=<STATE_BUCKET>"
```

Review the plan using your variable file:
```bash
opentofu plan -var-file=terraform.tfvars
```

Apply to create the VPC, firewall, and web VM:
```bash
opentofu apply -var-file=terraform.tfvars
```

After apply, fetch outputs such as the public IP:
```bash
opentofu output instance_external_ip
```

Clean up when finished:
```bash
opentofu destroy -var-file=terraform.tfvars
```

## What Gets Deployed
- VPC named from `network_name` with a custom subnetwork
- Firewall allowing TCP 22 and 80 from `firewall_sources`, targeting `network_tags`
- Compute instance (Debian 13) with NGINX installed via startup script and public IP for HTTP/SSH
