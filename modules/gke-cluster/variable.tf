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


