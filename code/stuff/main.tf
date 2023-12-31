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
  for_each            = var.vnets
  name                = each.key
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
  address_space       = [each.value.address_space]
}

locals {
  subnets_flatlist = flatten([
    for key, val in var.vnets : [
      for subnet in val.subnets : {
        vnet_name         = key
        subnet_name       = subnet.subnet_name
        subnet_address    = subnet.subnet_address
      }
    ]
  ])
//  subnets = { for subnet in local.subnets_flatlist : subnet.subnet_name => subnet ...}
}

resource "azurerm_subnet" "subnets" {
  for_each             = { 
    for subnet in local.subnets_flatlist : subnet.subnet_name => subnet ...
  }

  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_name].name
  address_prefixes     = [each.value.subnet_address]
}



output "result" {
  value = [for subnets in azurerm_subnet.subnets: subnets.name]
}

