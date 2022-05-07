#first service account
resource "google_service_account" "final-cluster-admin" {
  account_id = "cluster-admin"
  display_name = "final-k8s-admin"
}
resource "google_project_iam_member" "final-admin-binding" {
  project = "caramel-hallway-348507"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.final-cluster-admin.email}"
}

#second service account
resource "google_service_account" "final-node-accounts" {
  account_id = "node-acc"
  display_name = "node-acc"
}
resource "google_project_iam_member" "final-node-binding" {
  project = "caramel-hallway-348507"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.final-node-accounts.email}"
}