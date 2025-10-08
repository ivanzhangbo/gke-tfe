variable "project_id" {
  description = "The project ID to host the node pool in"
  type        = string
}

variable "region" {
  description = "The region to host the node pool in"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster to attach the node pool to"
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The machine type for the nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "The disk size for the nodes in GB"
  type        = number
  default     = 100
}

variable "service_account" {
  description = "The service account to be used by the nodes."
  type        = string
  default     = null
}

variable "boot_disk_kms_key" {
  description = "The KMS key for the node pool's boot disks."
  type        = string
  default     = null
}
