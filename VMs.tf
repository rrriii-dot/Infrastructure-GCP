resource "google_compute_instance" "final-public-vm"{
  name         = "final-public-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.final-subnet-1.id
  }
  
  service_account {
    email  = google_service_account.final-cluster-admin.email
    scopes = ["cloud-platform"]
  }

}
