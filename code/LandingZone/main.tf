locals {
  tags = {
    environment = "test"
    department = "IT"
    source = "terraform"
    "created by" = "someone"
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

module "resourcegroup" {
  source = "../modules/resourcegroup"
  resource_group_name          = var.resource_group_name
  resource_group_location      = var.resource_group_location
}

module "vnet" {
  source = "../modules/vnet"
  resource_group_name          = module.resourcegroup.resource_group_name
  resource_group_location      = module.resourcegroup.resource_group_location
  vnet_name                    = var.vnet_name
  vnet_address_space           = var.vnet_address_space
  
}
