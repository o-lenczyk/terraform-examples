terraform {
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
  zone        = "europe-west3-a"
  credentials = "gcp-key.json"
}

provider "google" {
  project     = "gcp101713-michalpiasecki"
  region      = "us-west3"
  zone        = "us-west3-a"
  credentials = "gcp-key.json"
  alias       = "us"
}