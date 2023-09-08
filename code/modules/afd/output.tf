output "frontDoorEndpointHostName" {
  value = azurerm_cdn_frontdoor_endpoint.my_endpoint.host_name
}

output "depended_on" {
  value = null_resource.dependency_setter.id
}

output "frontDoorEndpointProfileGUID" {
    value = azurerm_cdn_frontdoor_profile.my_front_door.resource_guid
}