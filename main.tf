
provider "aws" {
  region = "us-east-1"
}

module "website" {
  source = "./terraform-aws-module-s3_website"
  domain_name = "2039482183" #name of your bucket name/domain name
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
      source = "hashicorp/aws"
    }
  }
}