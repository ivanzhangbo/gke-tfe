resource "google_container_cluster" "primary" {
  project    = var.project_id
  name       = var.cluster_name
  location   = var.region
  network    = var.network
  subnetwork = var.subnetwork

  # Remove the default node pool so we can manage them separately
  remove_default_node_pool = true
  initial_node_count       = 1

  # Configuration for a private cluster
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  # IP allocation for pods and services
  ip_allocation_policy {
    cluster_secondary_range_name  = var.ip_range_pods_name
    services_secondary_range_name = var.ip_range_services_name
  }

  # It's a good practice to restrict access to the master endpoint
  master_authorized_networks_config {
    // cidr_blocks {
    //   cidr_block   = "x.x.x.x/32"
    //   display_name = "management-workstation"
    // }
  }

  # Standard cluster
  release_channel {
    channel = "REGULAR"
  }

  lifecycle {
    ignore_changes = [node_pool]
  }
}