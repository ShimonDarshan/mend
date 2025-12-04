# Mend's App

## Intro
To create an environment on the cloud, first you need to create an S3/Azure storage account to keep the relevant Terraform state files. This allows you and your team to maintain them without conflicts (using remote state files).

Under the infra folder, I created 4 sub-folders:
1. **AWS S3** - To store the Terraform state
2. **AWS EKS** - Creates the environment and uses the previous step's storage to store the state remotely
3. **Azure Storage** - Storage account to store the Terraform state for the Azure environment
4. **Azure AKS** - Contains the environment configuration

## Deployment Steps

To deploy an environment:
1. Choose which environment you want to create (AWS/Azure)
2. Navigate to the Terraform automation folder that manages the remote storage for your chosen cloud:
   - [AWS folder](./infra/aws-tfstate-storage)
   - [Azure folder](./infra/azure-tfstate-storage)
3. Run `terraform init` and then `terraform apply`
4. Navigate to the environment Terraform config folder:
   - [AWS](./infra/aws-envs)
   - [Azure](./infra/azure-envs)
5. Run `terraform init` and `terraform apply`
6. After the terraform apply step finishes, you will see the terraform output that contains the DNS of the application. You can visit it via the browser on port 80 or via curl.
## Modules

You can find my modules here:
- [Mend AWS Infrastructure](https://github.com/ShimonDarshan/mend-aws-infra)
- [Mend Azure Infrastructure](https://github.com/ShimonDarshan/mend-azure-infra)