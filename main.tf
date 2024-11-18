data "google_project" "default" {}
resource "google_storage_bucket" "default" {
  name          = "dsb-devsecops-lab-bucket"
  location      = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

resource "google_artifact_registry_repository" "default_docker_repo" {
  repository_id = "dsb-docker-images"
  format        = "DOCKER"
  location      = var.region
  description   = "Repository for all DSB Docker images"
}
