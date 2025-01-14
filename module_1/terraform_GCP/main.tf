terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.13.0"
    }
  }
}

provider "google" {
  credentials = var.credentials
  project = var.project_name
  region  = var.project_region
}

resource "google_storage_bucket" "demo-bucket" {
  name          = var.project_name
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo_dataset" {
        dataset_id = var.bq_dataset_name
        location = var.location
}



