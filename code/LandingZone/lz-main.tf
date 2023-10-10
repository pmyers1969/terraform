locals {
  tags = {
    environment  = "test"
    department   = "IT"
    source       = "terraform"
    "created by" = "someone"
  }
}

module "resourcegroup" {
  source                  = "../modules/resourcegroup"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "vnet" {
  source                  = "../modules/vnet"
  for_each                = var.vnets
  resource_group_name     = module.resourcegroup.resource_group_name
  resource_group_location = module.resourcegroup.resource_group_location
  vnet_name               = each.key
  address_space           = each.value.address_space
}

module "subnet" {
  source                  = "../modules/subnet"
  for_each                = flatten([for k, v in var.vnets : [for s in v.subnets : { vnet_key = k, subnet_name = s }]])
  subnet_name             = each.value.subnet_name
  address_prefix          = cidrsubnet(lookup(var.vnets, each.value.vnet_key).address_space, 8, each.key)
  vnet_id                 = module.vnet[each.value.vnet_key].vnet_id
  resource_group_name     = module.resourcegroup.resource_group_name
}

