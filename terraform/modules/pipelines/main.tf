# Cloud Build Pipeline for gcp-python-fastapi
# https://github.com/The-DevSec-Blueprint/gcp-python-fastapi/tree/main
resource "google_service_account" "cloudbuild_service_account" {
  account_id   = "${var.cloudbuild_trigger_name}-sa"
  display_name = "${var.cloudbuild_trigger_name}-sa"
  description  = "Cloud Build Service Account for ${var.cloudbuild_trigger_name}"
}

resource "google_project_iam_member" "cloud_build_roles" {
  for_each = toset([
    "roles/cloudbuild.builds.editor",
    "roles/cloudbuild.serviceAgent",
    "roles/source.admin",
    "roles/storage.admin",
    "roles/logging.logWriter",
    "roles/iam.serviceAccountUser",
    "roles/secretmanager.admin",
    "roles/secretmanager.secretAssessor"
  ])
  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
}

resource "google_cloudbuild_trigger" "build_trigger" {
  name        = "gh-trigger-${var.cloudbuild_trigger_name}"
  description = var.description
  filename    = var.filename

  service_account = google_service_account.cloudbuild_service_account.id
  location        = var.region

  github {
    owner = "The-DevSec-Blueprint"
    name  = var.github_repo_name
    push {
      branch = "^main$"
    }
  }

  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  depends_on = [
    google_service_account.cloudbuild_service_account,
    google_project_iam_member.cloud_build_roles
  ]
}
