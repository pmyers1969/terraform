output "frontDoorEndpointHostName" {
  value = azurerm_cdn_frontdoor_endpoint.my_endpoint.host_name
}

output "frontDoorEndpointProfileGUID" {
    value = azurerm_cdn_frontdoor_profile.my_front_door.resource_guid
}