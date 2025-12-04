variable "resource_group_name" {
  description = "Name of the resource group for state storage"
  type        = string
  default     = "rg-tfstate"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "northeurope"
}

variable "storage_suffix" {
  description = "Unique suffix for storage account name (3-24 chars, lowercase letters and numbers only)"
  type        = string
}

variable "containers_to_create" {
  description = "Name of the containers you want to create"
  type        = list(string)
}