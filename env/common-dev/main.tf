module "gke" {
  source = "../../modules/gke"

  project_id                  = var.project_id
  cluster_name                = var.cluster_name
  region                      = var.region
  network                     = var.network
  subnetwork                  = var.subnetwork
  ip_range_pods_name          = var.ip_range_pods_name
  ip_range_services_name      = var.ip_range_services_name
  private_endpoint_subnetwork = var.private_endpoint_subnetwork
  min_master_version          = var.min_master_version
}

module "gke_node_pools" {
  source = "../../modules/gke-node-pool"
  for_each = var.node_pools

  project_id        = var.project_id
  region            = var.region
  cluster_name      = module.gke.cluster_name
  node_pool_name    = each.key
  machine_type      = each.value.machine_type
  node_count        = each.value.node_count
  disk_size_gb      = each.value.disk_size_gb
  service_account   = each.value.service_account
  boot_disk_kms_key = each.value.boot_disk_kms_key
}