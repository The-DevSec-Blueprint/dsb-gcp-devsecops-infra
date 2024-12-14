variable "project_id" {
  type        = string
  description = "Project ID"
  default     = "dsb-innovation-hub"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-central1"
}

# Terraform Environment Variables
variable "SNYK_TOKEN" {}
