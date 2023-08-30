terraform {
  backend "azurerm" {
  }
}
# Configure the Azure provider
provider "azurerm" { 
   subscription_id = var.ARM_SUBSCRIPTION_ID
   client_id = var.ARM_CLIENT_ID
   client_secret = ARM_CLIENT_SECRET
   tenant_id = ARM_TENANT_ID
   features {}
}

resource "azurerm_resource_group" "slotDemo" {
    name = var.rg_name
    location = var.location
}
