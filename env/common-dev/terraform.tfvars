# Example values for the dev environment
# Replace with your actual values

project_id             = "your-gcp-project-id"
region                 = "your-gcp-region"
network                = "default"
subnetwork             = "gke-subnet"
ip_range_pods_name     = "pod-range"
ip_range_services_name = "svc-range"
private_endpoint_subnetwork = "master-subnet"
min_master_version            = "1.33" # Specify your desired master version
node_version                  = "1.33" # Specify your desired node version

node_pools = {
  "default-pool" = {
    machine_type      = "e2-medium"
    node_count        = 3
    disk_size_gb      = 100
    service_account   = "your-service-account@your-project-id.iam.gserviceaccount.com" # Specify your Service Account
    boot_disk_kms_key = "your-boot-disk-kms-key"                                         # Specify your Boot Disk KMS key
  }
}