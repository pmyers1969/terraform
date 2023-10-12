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

resource "azurerm_virtual_network" "vnet" {
  for_each              = var.vnets
  name                  = each.key
  address_space         = [each.value["address_space"]]
  location              = "AustraliaSoutheast"
  resource_group_name   = "rg-test"
}

resource "azurerm_subnet" "subnet" {
  for_each                  = flatten([for k, v in var.vnets : [for s in v.subnets : { vnet_key = k, subnet_name = s }]])
  resource_group_name       = "rg-test"
  virtual_network_name      = each.value.vnet_name
  name                      = each.value.subnet_name
  #address_prefixes          = cidrsubnet(lookup(var.vnets, each.value.vnet_key).address_space, 8, 0)
  address_prefixes        = "10.${substr(lookup(azurerm_virtual_network.vnet[each.key].address_space, 4, "0"), 0, 1)}.0.0/24"
}


output "result" {
  value = [for subnet in azurerm_subnet.subnet: subnet.name]
}

