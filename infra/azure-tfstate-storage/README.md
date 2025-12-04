# Azure Terraform State Storage

This directory contains infrastructure code to create an Azure Storage Account for storing Terraform state files.

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. Get the backend configuration:
   ```bash
   terraform output backend_config
   ```

## Outputs

- `storage_account_name` - The name of the created storage account
- `storage_container_name` - The name of the container (default: tfstate)
- `resource_group_name` - The resource group containing the storage account
- `backend_config` - Ready-to-use backend configuration block

## Using the Backend

After creating the storage account, use the output `backend_config` to configure your Terraform backend in other projects.
