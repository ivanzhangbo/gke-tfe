project_id                  = "qwiklabs-gcp-01-dc372e9d5259"
region                      = "europe-west4"
cluster_name                = "gke-cluster-dev"
network                     = "default"
subnetwork                  = "gke-subnet"
ip_range_pods_name          = "pod-range"
ip_range_services_name      = "svc-range"
private_endpoint_subnetwork = "master-subnet"
min_master_version          = "1.33"
node_version                = "1.33"
service_account_id          = "gke-sa"
kms_keyring_name            = "gke-keyring"
kms_key_name                = "gke-boot-key"

node_pools = {
  "comm-dev-node-pool" = {
    machine_type = "e2-medium"
    node_count   = 2
    disk_size_gb = 30
  }
}
