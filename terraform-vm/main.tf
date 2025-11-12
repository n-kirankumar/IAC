terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "venu-k-tf-state"   # <-- Your GCS bucket for storing terraform state
    prefix = "terraform/state"
  }
}

provider "google" {
  credentials = file("account.json")  # <-- Path to your service account key file
  project     = "venu-k"              # <-- Your GCP project ID
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["terraform", "vm"]
}
