# Create Virtual Network
resource "azure_rm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.resource_group_name
  resource_group_name = var.resource_group_location

}