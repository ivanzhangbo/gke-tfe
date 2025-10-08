resource "google_container_cluster" "primary" {
  project    = var.project_id
  name       = var.cluster_name
  location   = var.region
  network    = var.network
  subnetwork = var.subnetwork

  # Versions
  min_master_version = var.min_master_version
  node_version       = var.node_version

  # Remove the default node pool so we can manage them separately
  remove_default_node_pool = true
  initial_node_count       = 1

  # Maintenance policy
  maintenance_policy {
    recurring_window {
      start_time = "2025-01-05T02:00:00Z" # Sunday 2am
      end_time   = "2025-01-05T05:00:00Z" # Sunday 5am
      recurrence = "FREQ=WEEKLY;BYDAY=SU"
    }
  }

  # Configuration for a private cluster
  private_cluster_config {
    enable_private_nodes        = true
    enable_private_endpoint     = true
    private_endpoint_subnetwork = var.private_endpoint_subnetwork
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