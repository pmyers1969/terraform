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
  resource_group_name     = module.resourcegroup.resource_group_name
  resource_group_location = module.resourcegroup.resource_group_location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
}
