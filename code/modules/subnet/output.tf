output "azure_subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "The ID of the subnet created by this module instance."
}

output "azure_subnet_name" {
  value       = azurerm_subnet.subnet.name
  description = "The name of the subnet created by this module instance."
}