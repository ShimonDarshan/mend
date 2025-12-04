output "storage_account_name" {
  description = "Name of the created storage account"
  value       = module.tfstate_storage.storage_account_name
}

output "storage_container_name" {
  description = "Name of the storage container"
  value       = module.tfstate_storage.storage_container_names
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.tfstate.name
}

output "primary_access_key" {
  description = "Primary access key for the storage account (sensitive)"
  value       = module.tfstate_storage.primary_access_key
  sensitive   = true
}

output "backend_config" {
  description = "Backend configuration for using this storage"
  value       = <<-EOT
    terraform {
      backend "azurerm" {
        resource_group_name  = "${azurerm_resource_group.tfstate.name}"
        storage_account_name = "${module.tfstate_storage.storage_account_name}"
        container_name       = "${module.tfstate_storage.storage_container_names[0]}"
        key                  = "terraform.tfstate"
      }
    }
  EOT
}
