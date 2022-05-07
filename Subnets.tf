resource "google_compute_subnetwork" "final-subnet-1" {
  name          = "subnet-management"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "final-subnet-2" {
  name          = "subnet-restricted"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}