# Example values for the dev environment
# Replace with your actual values

project_id             = "your-gcp-project-id"
region                 = "your-gcp-region"
network                = "your-vpc-network-name"
subnetwork             = "your-vpc-subnetwork-name"
ip_range_pods_name     = "your-pods-ip-range-name"
ip_range_services_name = "your-services-ip-range-name"

node_pools = {
  "default-pool" = {
    machine_type = "e2-medium"
    node_count   = 2
    disk_size_gb = 100
  }
  # You can add more node pools here
  # "another-pool" = {
  #   machine_type = "n2-standard-2"
  #   node_count   = 1
  #   disk_size_gb = 50
  # }
}