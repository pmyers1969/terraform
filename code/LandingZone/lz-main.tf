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

locals {
  subnets = flatten([
    for vnet_name, vnet in var.vnets : [
      for subnet_index, subnet_name in vnet.subnets : {
        vnet_name    = vnet_name
        subnet_name  = subnet_name
        subnet_index = subnet_index
      }
    ]
  ])
}

module "subnet" {
  source                  = "../modules/subnet"
  for_each                = { for s in local.subnets : "${s.vnet_name}-${s.subnet_name}" => s }
  subnet_name             = each.value.subnet_name
  address_prefix          = [cidrsubnet(var.vnets[each.value.vnet_name].address_space, 8, each.value.subnet_index)]
  vnet_name               = each.value.vnet_name
  resource_group_name     = module.resourcegroup.resource_group_name
  depends_on              = [module.vnet]
}

