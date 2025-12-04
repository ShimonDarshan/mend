variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
}

variable "aks_subnet_prefix" {
  description = "AKS subnet prefix"
  type        = string
}

variable "appgw_subnet_prefix" {
  description = "Application Gateway subnet prefix"
  type        = string
}

variable "service_cidr" {
  description = "Kubernetes service CIDR"
  type        = string
}

variable "dns_service_ip" {
  description = "Kubernetes DNS service IP"
  type        = string
}

variable "dns_label" {
  description = "DNS label for public IP"
  type        = string
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
}

variable "vm_size" {
  description = "VM size"
  type        = string
}

variable "oci_chart_url" {
  description = "OCI Helm chart URL (e.g., oci://ghcr.io/owner/repo/chart:version)"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version"
  type        = string
}

variable "helm_release_name" {
  description = "Helm release name"
  type        = string
}

variable "helm_namespace" {
  description = "Kubernetes namespace for Helm release"
  type        = string
}

# variable "state_storage_suffix" {
#   description = "Unique suffix for storage account name (must be globally unique, 3-24 chars, lowercase letters and numbers only)"
#   type        = string
# }

# variable "environment" {
#   description = "Environment name (used for remote state key path)"
#   type        = string
# }

variable "backend_resource_group_name" {
  description = "Resource group name for Terraform state storage"
  type        = string
}

variable "backend_storage_account_name" {
  description = "Storage account name for Terraform state"
  type        = string
}

variable "backend_container_name" {
  description = "Container name for Terraform state"
  type        = string
}

variable "backend_key_name" {
  description = "Container name for Terraform state"
  type        = string
  default     = ""
}