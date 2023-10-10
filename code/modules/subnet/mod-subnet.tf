resource "azurerm_subnet" "subnet" {
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_name
  name                      = var.subnet_name
  address_prefixes          = var.address_prefix
}