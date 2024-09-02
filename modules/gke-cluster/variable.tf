variable "cluster_name" {
    type        = string
    description = "cluster name"
}

variable "region" {
  description = "The region where the resources will be deployed"
  type        = string
}

variable "vpc-name" {
  description = "vpc name "
  type        = string
}

variable "private-subnet-name" {
   type = string
  description = "private-subnet"
}

variable "zone" {
  description = "The zone where the resources will be deployed"
  type        = string
}

variable "infrastructure_name" {
  type        = string
  description = "The name of the infrastructure"
}

variable "node-pool-name" {
  type        = string
  description = "node pool name"
}

variable "machine_type" {
    type        = string
    description = "machine type"
  
}

variable "gke_service_account_email" {
  type = string
  description = "gke service account gmail"
}


variable "secondary_ip_range_services_name" {
  description = "The name of the secondary IP range for services"
  type        = string
}

variable "secondary_ip_range_services_cidr" {
  description = "The CIDR range of the secondary IP range for services"
  type        = string
}

variable "secondary_ip_range_pods_name" {
  description = "The name of the secondary IP range for pods"
  type        = string
}

variable "secondary_ip_range_pods_cidr" {
    type = string
    description = " secondary ip range for gke pods" 
}

variable "master_ipv4_cidr_block" {
  type = string
  description = "master ip adress"
}

variable "disk_size_gb" {
    type = string
  description = "node disk size"
}

variable "min_node_count" {
    type = string
  description = "node disk size"
}

variable "max_node_count" {
    type = string
  description = "node disk size"
}