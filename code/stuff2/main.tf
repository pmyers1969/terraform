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
  address_space       = each.value.address_space
}

locals {
  network_subnets = flatten([
    for network_key, network in var.vnets : [
      for subnet_key, subnet in network.subnets : {
        network_key   = network_key
        subnet_key    = subnet_key
        subnet_name   = subnet["subnet_name"]
        cidr_block    = subnet["cidr_block"]
      }
    ]
  ])
//  subnets = { for subnet in local.subnets_flatlist : subnet.subnet_name => subnet ...}
}

resource "azurerm_subnet" "subnets" {
  for_each             = { 
    for subnet in local.network_subnets : subnet.subnet_key => subnet
  }

  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = each.value.network_key
  address_prefixes     = [each.value.cidr_block]
}



output "result" {
  value = [for subnets in azurerm_subnet.subnets: subnets.name]
}

