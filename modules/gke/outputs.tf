output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster's master"
  value       = google_container_cluster.primary.private_cluster_config[0].private_endpoint
  sensitive   = true
}
