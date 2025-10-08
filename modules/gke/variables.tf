variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  type        = string
  default     = "gke-cluster"
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
}

variable "network" {
  description = "The VPC network to host the cluster in"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
  type        = string
}

variable "ip_range_pods_name" {
  description = "The name of the secondary subnet ip range for pods"
  type        = string
}

variable "ip_range_services_name" {
  description = "The name of the secondary subnet ip range for services"
  type        = string
}
