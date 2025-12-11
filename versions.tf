terraform {
  required_version = ">= 1.10.0"

  backend "gcs" {
    bucket = "bootcamp-478214-opentofu-tfstate"
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}
