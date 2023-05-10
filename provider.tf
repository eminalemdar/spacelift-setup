terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.66.1"
    }
    spacelift = {
      source = "spacelift-io/spacelift"
      version = "1.1.5"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


provider "spacelift" {}