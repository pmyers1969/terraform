output "azure_subnet_id" {
  value = {
    for id in keys(var.subnets) : id => azurerm_subnet.subnet[id].id
  }
  description = "Lists the ID's of the subnets. => is a separator for the key, value pair"
}