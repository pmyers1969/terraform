locals {
  tags = {
    environment = "test"
    department = "IT"
    source = "terraform"
  }
}

terraform {
  backend "azurerm" {
  }
}
# Configure the Azure provider
provider "azurerm" { 
   subscription_id = var.ARM_SUBSCRIPTION_ID
   client_id = var.ARM_CLIENT_ID
   client_secret = var.ARM_CLIENT_SECRET
   tenant_id = var.ARM_TENANT_ID
   features {}
}

resource "azurerm_resource_group" "rgdemo" {
    name = var.rg_name
    location = var.loc

    tags = merge(local.tags, {
    workload = "testresources"
  })
}
