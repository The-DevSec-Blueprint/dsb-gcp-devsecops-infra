# Build Buckets
resource "google_storage_bucket" "default" {
  name          = "dsb-devsecops-lab-bucket"
  location      = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

# Artifact Repository (Registry)
resource "google_artifact_registry_repository" "default" {
  repository_id = "dsb-docker-images"
  format        = "DOCKER"
  location      = var.region
  description   = "Repository for all DSB Docker images"
}

# Secrets
resource "google_secret_manager_secret" "snyk_token" {
  secret_id = "cloudbuild/snyk-token"

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "snyk_token_version" {
  secret      = google_secret_manager_secret.snyk_token.id
  secret_data = var.SNYK_TOKEN
}