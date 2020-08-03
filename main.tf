provider "google" {
  version = "3.5.0"

  credentials = file(var.credentials)

  project = "terraform-project1-285302"
  region  = "australia-southeast1"
  zone    = "australia-southeast1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
