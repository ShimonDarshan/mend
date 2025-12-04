# Resource Group for Terraform State Storage
resource "azurerm_resource_group" "tfstate" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    purpose    = "terraform-state-storage"
    managed_by = "terraform"
  }
}

# Storage Account Module
module "tfstate_storage" {
  source = "github.com/ShimonDarshan/mend-azure-infra/modules/tfstate-storage?ref=add-module"

  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  storage_suffix           = var.storage_suffix
  container_names          = var.containers_to_create
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
