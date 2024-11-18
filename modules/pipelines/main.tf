# Cloud Build Pipeline for gcp-python-fastapi
# https://github.com/The-DevSec-Blueprint/gcp-python-fastapi/tree/main
resource "google_service_account" "cloudbuild_service_account" {
  account_id   = "${var.cloudbuild_trigger_name}-sa"
  display_name = "${var.cloudbuild_trigger_name}-sa"
  description  = "Cloud Build Service Account for ${var.cloudbuild_trigger_name}"
}

resource "google_project_iam_member" "act_as" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
}

resource "google_project_iam_member" "logs_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
}

resource "google_cloudbuild_trigger" "build_trigger" {
  name        = var.cloudbuild_trigger_name
  description = var.description
  filename    = var.filename

  service_account = google_service_account.cloudbuild_service_account.id

  github {
    owner = "The-DevSec-Blueprint"
    name  = var.github_repo_name
    push {
      branch = "^main$"
    }
  }
}
