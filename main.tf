provider "google" {
  version = "3.5.0"

  credentials = (var.credentials)

  project = "terraform-project1-285302"
  region  = "australia-southeast1"
  zone    = "australia-southeast1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.vpc_network
    access_config {
    }
  }
}
