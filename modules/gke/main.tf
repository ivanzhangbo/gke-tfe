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
      start_time = "2025-10-12T10:00:00Z"
      end_time   = "2025-10-12T22:00:00Z"
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

# GKE Service Account
resource "google_service_account" "gke_sa" {
  project = var.project_id
  account_id = var.service_account_id
  display_name = "GKE Service Account"
}

# KMS KeyRing
resource "google_kms_key_ring" "gke_keyring" {
  project = var.project_id
  name = var.kms_keyring_name
  location = var.region
}

# KMS CryptoKey
resource "google_kms_crypto_key" "gke_boot_key" {
  name = var.kms_key_name
  key_ring = google_kms_key_ring.gke_keyring.id
  rotation_period = "100000s"
  lifecycle {
    prevent_destroy = true
  }
}

# Grant the service account permission to use the KMS key
resource "google_kms_crypto_key_iam_member" "gke_boot_key_user" {
  crypto_key_id = google_kms_crypto_key.gke_boot_key.id
  role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member = "serviceAccount:${google_service_account.gke_sa.email}"
}

  