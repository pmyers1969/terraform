locals {
  subnets_flatlist = flatten([for key, val in var.vnets : [
    for subnet in val.subnets : {
      vnet_name         = key
      subnet_name       = subnet.subnet_name
      subnet_address    = subnet.subnet_address
      service_endpoints = subnet.service_endpoints
    }
    ]
  ])
  subnets = { for subnet in local.subnets_flatlist : subnet.subnet_name => subnet... }
}