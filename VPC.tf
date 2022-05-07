resource "google_compute_network" "vpc_network" {
  project = "caramel-hallway-348507"
  name = "vpc-final"
  auto_create_subnetworks = false
  mtu                     = 1460
}