# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  subscription_id = var.ARM_SUBSCRIPTION_ID
  client_id = var.ARM_CLIENT_ID
  client_secret = var.ARM_CLIENT_SECRET
  tenant_id = var.ARM_TENANT_ID
  features {}
}

locals {
  flattened_map = flatten([for k, v in var.vnets : [for s in v.subnets : { vnet_key = k, subnet_name = s }]])
}

output "result" {
  value = local.flattened_map
}

