variable "project" {
  description = "The ID of the GCP project"
  type        = string
}

variable "infrastructure_name" {
    description = "infrasture name"
    type        = string
}

variable "region" {
  description = "The region where the resources will be deployed"
  type        = string
}

variable "zone" {
  description = "The zone where the resources will be deployed"
  type        = string
}


# variable "name" {
#   description = "infrastructure name"
#   type        = string
# }

variable "environment" {
  description = "infrastructure environment name"
  type        = string
}

variable "vpc-name" {
  description = " vpc name"
  type        = string
}
variable "ip_cidr_range" {
  type = string
  description = "ip cidr range for the private subnet"
}


variable "routing_mode" {
  type = string
  description = "routing mode for the vpc"
}

variable "nat_ip_allocate_option" {
  type = string
  description = "nat ip allocate option"
}
variable "source_subnetwork_ip_ranges_to_nat" {
  type = string
  description = "source subnetwork ip ranges to nat"
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(string)
}

variable "internal_source_ranges" {
  description = "Internal source range allowed"
  type        = list(string)
}

variable "gke_service_account_id" {
    type = string
    description = "service account id for the gke cluster"
}

variable "gke_service_account_name" {
  description = "gke service account"
  type        = string
}


variable "nat-router-name" {
  type = string
  description = "combines with the nat gateway to manage the GKE egress taffic"
  # default = "nat_router"
}

variable "internal-firewall-rule-name" {
    type = string
    description = "allow internal communication within the VPC (Virtual Private Cloud) network."
}

variable "private-subnet-name" {
   type = string
  description = "private-subnet"
}

variable "nat_gateway" {
  type = string
  description = "manages the GKE egress taffic"
}

variable "cluster_name" {
    type        = string
    description = "cluster name"
}

variable "node-pool-name" {
  type        = string
  description = "node pool name"
}

variable "machine_type" {
    type        = string
    description = "node pool name"
  
}
