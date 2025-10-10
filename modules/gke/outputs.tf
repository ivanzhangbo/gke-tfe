output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster's master"
  value       = google_container_cluster.primary.private_cluster_config[0].private_endpoint
  sensitive   = true
}

output "service_account" {
  description = "The email of the GKE service account"
  value       = google_service_account.gke_sa.email
}

output "boot_disk_kms_key" {
  description = "The ID of the boot disk KMS key"
  value       = google_kms_crypto_key.gke_boot_key.id
}
