provider "google" {
  credentials = file("gcp-api-infrastructure.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}


module "vpc-network" {
  source       = "./modules/vpc-network"
  project = var.project
  vpc-name = var.vpc-name
  ip_cidr_range = var.ip_cidr_range
  environment = var.environment
  region       = var.region
  routing_mode = var.routing_mode
  nat_ip_allocate_option = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  allowed_ports = var.allowed_ports
  internal_source_ranges = var.internal_source_ranges
  infrastructure_name = var.infrastructure_name
  nat-router-name = var.nat-router-name
  internal-firewall-rule-name = var.internal-firewall-rule-name
  private-subnet-name = var.private-subnet-name
  nat_gateway = var.nat_gateway
  
  
}

module "iam" {
  source                = "./modules/iam"
  project          = var.project
  gke_service_account_id = var.gke_service_account_id
  name                   =  var.gke_service_account_name

}

module "gke-cluster" {
  source           = "./modules/gke-cluster"
  vpc-name          =    module.vpc-network.network_self_link
  private-subnet-name   = module.vpc-network.subnet_self_link
  cluster_name     = var.cluster_name
  region           = var.region
  zone             = var.zone
  infrastructure_name = var.infrastructure_name
  node-pool-name =    var.node-pool-name
  machine_type = var.machine_type
  gke_service_account_email = module.iam.gke_service_account_email

}