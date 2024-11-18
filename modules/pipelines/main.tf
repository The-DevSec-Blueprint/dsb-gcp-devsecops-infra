# Cloud Build Pipeline for gcp-python-fastapi
# https://github.com/The-DevSec-Blueprint/gcp-python-fastapi/tree/main
resource "google_cloudbuild_trigger" "build_trigger" {
  name        = var.cloudbuild_trigger_name
  description = var.description
  filename    = var.filename

  github {
    owner = "The-DevSec-Blueprint"
    name  = var.github_repo_name
    push {
      branch = "^main$"
    }
  }
}
