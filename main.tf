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

/*resource "google_container_cluster" "primary" {
  name     = "dsb-devsecops-cluster"
  location = var.region

  # Enable GKE features
  remove_default_node_pool = true
  deletion_protection = false

  cluster_autoscaling {
    enabled = false
  }

  # Specify network and subnetwork
  network    = "default"
  subnetwork = "default"
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1  # Single node in the pool - super cheap :)
  max_pods_per_node = 8
  
  node_config {
    preemptible = true
    machine_type = "e2-standard-8"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}*/
