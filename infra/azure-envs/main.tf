# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# AKS Cluster Module
module "aks" {
  source = "github.com/ShimonDarshan/mend-azure-infra/modules/aks-cluster?ref=main"

  name                = var.cluster_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  vnet_address_space  = var.vnet_address_space
  aks_subnet_prefix   = var.aks_subnet_prefix
  appgw_subnet_prefix = var.appgw_subnet_prefix
  service_cidr        = var.service_cidr
  dns_service_ip      = var.dns_service_ip
  dns_label           = var.dns_label
  node_count          = var.node_count
  vm_size             = var.vm_size

  # Helm chart configuration
  oci_chart_url     = var.oci_chart_url
  chart_version     = var.chart_version
  helm_release_name = var.helm_release_name
  helm_namespace    = var.helm_namespace
}
