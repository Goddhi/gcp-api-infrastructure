
project = "wide-axiom-428919-s0"

infrastructure_name = "gcp-api-infrastructure"

region = "us-central1"
zone = "us-central1-a"

vpc-name = "vpc-network"
ip_cidr_range = "10.0.0.0/16"

routing_mode = "REGIONAL"


# gke_service_account_name = "gcp-api-infrastructure"
# tags = {
#   Owner-Email     = "godwillcharles22@gmail.com"
#   Managed-By      = "Terraform"
#   Billing-Account = "1234567890"
# }



environment = "dev"

nat_ip_allocate_option = "AUTO_ONLY"

source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

allowed_ports = ["22", "443"]

internal_source_ranges = ["10.0.0.0/16"]

gke_service_account_name = "cluster-service-account"

gke_service_account_id = "cluster-service-account-id"

nat-router-name = "nat-router"

internal-firewall-rule-name = "internal-firewall-rule"

private-subnet-name = "private-subnet"

nat_gateway = "nat-gateway"

cluster_name = "gke-cluster"

node-pool-name = "primary-node-pool"

machine_type = "e2-medium"

secondary_ip_range_services_cidr = "192.168.0.0/24"

secondary_ip_range_pods_cidr = "192.168.1.0/24"

secondary_ip_range_pods_name = "pods-range"

secondary_ip_range_services_name = "services-range"

master_ipv4_cidr_block = "10.0.1.0/28"

disk_size_gb = "10"

min_node_count = "1"

max_node_count = "2"
# destination_cidr_block = "0.0.0.0/0"




# Ensure to change this to your acccount number
# account_no = "123456789"


# ### -------- ALB -------- ###
# ip_address_type     = "ipv4"
# load_balancer_type  = "application"
# port                = 80
# protocol            = "HTTP"
# company_name        = "ACS"
# interval            = 10
# path                = "/healthstatus"
# timeout             = 5
# healthy_threshold   = 5
# unhealthy_threshold = 2
# target_type         = "instance"
# default_action_type = "forward"
# priority            = 99
