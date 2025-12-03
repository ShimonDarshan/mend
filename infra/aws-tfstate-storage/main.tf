module "tfstate_storage" {
  source = "github.com/ShimonDarshan/mend-aws-infra/modules/s3storage?ref=add-module"

  bucket_name = var.bucket_name
  environment = var.environment

  tags = {
    Project     = "AWS Infrastructure"
    Owner       = "DevOps Team"
    ManagedBy   = "Terraform"
    Description = "Terraform state storage bucket"
  }
}
