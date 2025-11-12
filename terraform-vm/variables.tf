variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "venu-k"
}

variable "region" {
  description = "Region for GCP resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone for compute instance"
  type        = string
  default     = "us-central1-a"
}
