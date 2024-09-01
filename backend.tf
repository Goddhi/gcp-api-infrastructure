terraform {
  backend "gcs" {
    bucket = "gcp-api-infrastrtucture-bucket-1"
    prefix = "terraform/state"
  }
}


