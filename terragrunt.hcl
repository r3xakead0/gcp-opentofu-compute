locals {
  project_id  = get_env("GCP_PROJECT_ID")
  gcs_bucket  = get_env("GCS_BUCKET")
  state_scope = coalesce(get_env("TG_STATE_PREFIX"), "terragrunt")
}

remote_state {
  backend = "gcs"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket = local.gcs_bucket
    prefix = "${local.state_scope}/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = local.project_id
}
