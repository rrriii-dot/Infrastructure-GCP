resource "google_compute_router" "router" {
  name    = "final-router"
  region  = google_compute_subnetwork.final-subnet-1.region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "nat" {
  name                               = "final-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

subnetwork {
    name                    = google_compute_subnetwork.final-subnet-1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}