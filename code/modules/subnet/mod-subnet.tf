resource "azurerm_subnet" "subnet" {
  for_each = var.subnet
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_name
  name                      = each.value["name"]
  address_prefixes          = each.value["address_prefixes"]
}