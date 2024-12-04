terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.0.0, < 5.0.0"
    }

  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      "project"                  = var.project
      "tenant"                   = var.tenant
     
    }
  }
}
