# AWS Terraform State Storage

This Terraform configuration creates an S3 bucket for storing Terraform state files with best practices for security and versioning.

## Overview

This module sets up:
- S3 bucket for Terraform state storage
- Versioning enabled for state file history
- Server-side encryption
- Appropriate bucket policies for secure access

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0

## Usage

1. **Configure variables** in `terraform.tfvars`:
   ```hcl
   bucket_name  = "my-terraform-state-bucket"
   environment  = "dev"
   aws_region   = "us-east-1"
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Plan the deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the configuration**:
   ```bash
   terraform apply
   ```

## Outputs

- `bucket_id` - The S3 bucket ID
- `bucket_arn` - The S3 bucket ARN
- `bucket_name` - The S3 bucket name
- `bucket_region` - The AWS region of the bucket

## Using the State Bucket

After creating the bucket, configure your Terraform backend in other projects:

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "path/to/my/state"
    region = "us-east-1"
  }
}
```
