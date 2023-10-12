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

data "azurerm_resource_group" "network" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnets" {
  for_each            = var.vnets
  name                = each.key
  resource_group_name = data.azurerm_resource_group.network.name
  location            = data.azurerm_resource_group.network.location
  address_space       = [each.value.address_space]
}

resource "azurerm_subnet" "subnets" {
  for_each             = local.subnets
  name                 = each.value.subnet_name
  resource_group_name  = data.azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_name].name
  address_prefixes     = [each.value.subnet_address]
  service_endpoints    = each.value.service_endpoints
}



output "result" {
  value = [for subnets in azurerm_subnet.subnets: subnets.name]
}

