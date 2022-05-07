resource "google_container_cluster" "cluster" {
  name     = "final-cluster"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc_network.self_link
  subnetwork               = google_compute_subnetwork.final-subnet-2.self_link

  node_locations = [
    "us-central1-b"
  ]
    master_authorized_networks_config {
        
        cidr_blocks{
            cidr_block = google_compute_subnetwork.final-subnet-1.ip_cidr_range
            display_name = "Managment-cidr"
        }

    }
    ip_allocation_policy {

  }
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "192.168.1.0/28"
  }
}

resource "google_container_node_pool" "nodePool" {
  name       = "final-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.cluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-small"

    service_account = google_service_account.final-node-accounts.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}