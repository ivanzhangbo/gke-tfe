variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  type        = string
  default     = "gke-cluster-dev"
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

variable "node_pools" {
  description = "A map of node pools to create. The key is the node pool name."
  type = map(object({
    machine_type = string
    node_count   = number
    disk_size_gb = number
  }))
  default = {}
}