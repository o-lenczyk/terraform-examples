terraform {
  required_version = ">=1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.35.0"
    }
  }

  cloud {
    organization = "orest"
    workspaces {
      name = "orest1"
    }
  }
}

provider "google" {
  project     = "gcp101713-michalpiasecki"
  region      = "europe-west3"
  zone        = "europe-west3-b"
  credentials = "gcp-key.json"
}

provider "google" {
  project     = "gcp101713-michalpiasecki"
  region      = "us-west3"
  zone        = "us-west3-b"
  credentials = "gcp-key.json"
  alias       = "us"
}

