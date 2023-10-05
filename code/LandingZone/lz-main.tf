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
  subnet_names            = each.value.subnet_names
  vnet_address_space      = each.value.address_space
}

#module "subnet" {
#  source                  = "../modules/subnet"
#  resource_group_name     = module.resourcegroup.resource_group_name
#  vnet_name               = module.vnet.vnet_name
#  subnets                 = var.subnets
#}