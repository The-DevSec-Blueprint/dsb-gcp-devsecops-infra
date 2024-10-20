data "google_project" "default" {}
resource "google_storage_bucket" "default" {
  name          = "dsb-devsecops-lab"
  location      = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}