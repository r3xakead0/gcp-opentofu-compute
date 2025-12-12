# GCP OpenTofu Compute

Infrastructure-as-code example that provisions a small web stack on Google Cloud Platform using OpenTofu. It creates a VPC, subnetwork, firewall to allow SSH/HTTP, and a Debian 13 compute instance that auto-installs NGINX and serves a simple page.

## Requirements
- OpenTofu `>= 1.10.0`
- Terragrunt `>= 0.95.0`
- `gcloud` CLI with Application Default Credentials (`gcloud auth application-default login`) or a `GOOGLE_APPLICATION_CREDENTIALS` service account key
- GCP project with billing enabled
- GCS bucket for remote state
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

## Terragrunt layout
- `modules/`: Network and compute reusable modules
- `environments/{dev,qa,prod}/terragrunt.hcl`: per-environment inputs that call the root stack
- `terragrunt.hcl` (root): shared remote state config for all environments

## Usage with Terragrunt
Set the project and bucket before running commands:
```bash
export GCP_PROJECT_ID="<your-project-id>"
export GCS_BUCKET="<state-bucket>"
# Optional: prefix to namespace state objects (defaults to "terragrunt")
export TG_STATE_PREFIX="<repo>/opentofu"
```

Plan/apply/destroy from the environment directory you want:
```bash
cd environments/dev   # or qa / prod
terragrunt plan --tf-path tofu
terragrunt apply --tf-path tofu -auto-approve
terragrunt destroy --tf-path tofu -auto-approve
```

After apply, fetch outputs such as the public IP:
```bash
terragrunt output --tf-path tofu instance_external_ip
```

## What Gets Deployed
- VPC named from `network_name` with a custom subnetwork
- Firewall allowing TCP 22 and 80 from `firewall_sources`, targeting `network_tags`
- Compute instance (Debian 13) with NGINX installed via startup script and public IP for HTTP/SSH
