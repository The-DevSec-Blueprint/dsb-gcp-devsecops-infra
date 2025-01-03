variable "cloudbuild_trigger_name" {
  description = "Name of the Cloud Build trigger"
  type        = string
}

variable "description" {
  description = "Description of the Cloud Build trigger"
  type        = string
}

variable "filename" {
  description = "Path to the Cloud Build configuration file"
  type        = string
  default     = "cloudbuild.yaml"
}

variable "github_repo_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "project_id" {
  description = "ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "Region where the Cloud Build trigger will be created"
  type        = string
}

variable "secret_id" {
  description = "ID of the secret to be injected into the Cloud Build"
  type        = string
}