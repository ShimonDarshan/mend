terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatemend001"
    container_name       = "env01"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
