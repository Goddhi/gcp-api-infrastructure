terraform {
  backend "gcs" {
    bucket = "gcp-api-infrastructure-tf-state-bucket"
    prefix = "terraform/state"
  }
}