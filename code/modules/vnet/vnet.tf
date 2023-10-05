# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.key
  address_space       = [each.value["address_space"]]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

}

resource "azurerm_subnet" "subnet" {
  for_each              = {for vnet_key, vnet_config in var.vnets : vnet_key => vnet_config.subnets}
  name                  = each.key
  address_prefix        = "10.${substr(lookup(azurerm_virtual_network.vnet[each.value.vnet_name].address_space, 4, "0"), 0, 1)}.0.0/24"
  virtual_network_name  = azurerm_virtual_network.vnet[each.key].name
  resource_group_name   = azurerm_resource_group.example.name
}