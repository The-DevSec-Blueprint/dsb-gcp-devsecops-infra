terraform {
  cloud {
    organization = "DSB"

    workspaces {
      name = "dsb-gcp-devsecops-infra"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}