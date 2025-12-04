# AKS Cluster with Application Gateway

Simple AKS deployment with Application Gateway using Terraform modules.

## Prerequisites

1. Ensure the tfstate storage account is created:
   ```bash
   cd ../azure-tfstate-storage
   terraform init
   terraform apply
   ```

## Quick Start

```bash
# Login
az login

# Initialize with remote backend (dev environment)
terraform init -backend-config=backend.tfvars

# Or for production
# terraform init -backend-config=backend-prod.tfvars

# Or for staging
# terraform init -backend-config=backend-staging.tfvars

# Deploy
terraform apply

# Get credentials
terraform output -raw get_credentials | bash

# Deploy sample app
kubectl apply -f ../../k8s/
```

## Access Your App

```bash
# Get public IP
terraform output public_ip
```

Visit `http://<PUBLIC_IP>`

## Clean Up

```bash
terraform destroy
```

## Customize

Edit `terraform.tfvars` for infrastructure configuration or `backend.tfvars` / `backend-prod.tfvars` / `backend-staging.tfvars` for backend settings.

## Multiple Clusters

Deploy multiple clusters with different networks:

```hcl
module "aks_dev" {
  source = "./modules/aks-cluster"
  
  name                = "dev"
  location            = "northeurope"
  resource_group_name = azurerm_resource_group.main.name
  vnet_address_space  = ["10.0.0.0/16"]
  aks_subnet_prefix   = "10.0.1.0/24"
  appgw_subnet_prefix = "10.0.2.0/24"
  service_cidr        = "10.1.0.0/16"
  dns_service_ip      = "10.1.0.10"
}

module "aks_prod" {
  source = "./modules/aks-cluster"
  
  name                = "prod"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.main.name
  vnet_address_space  = ["10.10.0.0/16"]
  aks_subnet_prefix   = "10.10.1.0/24"
  appgw_subnet_prefix = "10.10.2.0/24"
  service_cidr        = "10.11.0.0/16"
  dns_service_ip      = "10.11.0.10"
}
```
