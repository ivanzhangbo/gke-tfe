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

variable "private_endpoint_subnetwork" {
  description = "The subnetwork for the private endpoint"
  type        = string
}

variable "min_master_version" {
  description = "The minimum master version for the GKE cluster"
  type        = string
  default     = null
}

variable "node_version" {
  description = "The node version for the GKE cluster"
  type        = string
  default     = null
}

variable "service_account_id" {
  description = "The ID of the service account to create"
  type        = string
}

variable "kms_keyring_name" {
  description = "The name of the KMS keyring to create"
  type        = string
}

variable "kms_key_name" {
  description = "The name of the KMS key to create"
  type        = string
}
