module "gcp_python_fastapi_pipeline" {
  source                  = "./modules/pipelines"
  cloudbuild_trigger_name = "gcp-python-fastapi"
  description             = "Cloud Build Trigger for GCP Python FastAPI"
  github_repo_name        = "gcp-python-fastapi"

  depends_on = [google_artifact_registry_repository.default_docker_repo]
}