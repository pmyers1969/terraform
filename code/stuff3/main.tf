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

resource "azurerm_resource_group" "network" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnets" {
  for_each = { for idx, network in var.vnets : idx => network }
  name                = each.value.vnet_name
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
  address_space       = each.value.address_space
}



