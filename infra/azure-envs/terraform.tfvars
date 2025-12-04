resource_group_name = "rg-aks-demo"
location            = "northeurope"
cluster_name        = "shimon-demo"
vnet_address_space  = ["10.0.0.0/16"]
aks_subnet_prefix   = "10.0.1.0/24"
appgw_subnet_prefix = "10.0.2.0/24"
service_cidr        = "10.1.0.0/16"
dns_service_ip      = "10.1.0.10"
dns_label           = "shimondarshan-azure-mend"
node_count          = 2
vm_size             = "Standard_D2s_v3"

oci_chart_url     = "oci://ghcr.io/shimondarshan/mendchart/mend"
chart_version     = "0.1.0"
helm_release_name = "mend"
helm_namespace    = "mend"

# Backend configuration
backend_resource_group_name  = "rg-tfstate"
backend_storage_account_name = "tfstatemend001"
backend_container_name       = "env01"
backend_key_name             = "terraform.tfstate"

