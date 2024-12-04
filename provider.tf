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
      "owner"                    = var.owner
      "project"                  = var.project
      "application"              = var.application
      "cost-centre"              = var.cost_centre
      "tenant"                   = var.tenant
      "environment"              = var.environment
      "iac"                      = "terraform"
      "security:compliance-gdpr" = var.sec_gdpr
      "security:compliance-pci"  = var.sec_pci
      "security:customer-data"   = var.sec_customer_data
      "security:confidentiality" = var.sec_confidentiality
      "git:org"                  = "organization name"
    }
  }
}
