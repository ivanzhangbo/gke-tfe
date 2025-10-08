resource "google_container_node_pool" "pool" {
  project    = var.project_id
  location   = var.region
  cluster    = var.cluster_name
  name       = var.node_pool_name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
