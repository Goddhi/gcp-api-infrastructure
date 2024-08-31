provider "google" {
  credentials = file("<path_to_your_service_account_json>")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "iam" {
  source                = "./modules/iam"
  project_id            = var.project_id
  gke_service_account_id = "gke-service-account"
}

module "network" {
  source       = "./modules/network"
  network_name = "vpc-network"
  subnet_name  = "subnet"
  subnet_cidr  = "10.0.0.0/16"
  router_name  = "nat-router"
  nat_name     = "nat-gateway"
  region       = var.region
}

module "security" {
  source           = "./modules/security"
  network_self_link = module.network.network_self_link
}

module "gke-cluster" {
  source            = "./modules/gke-cluster"
  cluster_name      = "gke-cluster"
  region            = var.region
  zone              = var.zone
  network_self_link = module.network.network_self_link
  subnet_self_link  = module.network.subnet_self_link
  gke_service_account_email = module.iam.gke_service_account_email
}
