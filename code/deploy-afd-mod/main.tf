
module "resourcegroup" {
  source = "../modules/resourcegroup"
  resource_group_name          = var.resource_group_name
  resource_group_location      = var.resource_group_location
}


module "appservice" {
  source = "../modules/appservice"
  resource_group_name          = module.resourcegroup.name
  resource_group_location      = module.resourcegroup.location
  app_service_plan_name        = var.app_service_plan_name
  app_service_plan_sku_name    = var.app_service_plan_sku_name
  app_service_plan_capacity    = var.app_service_plan_capacity
  webapp_name                  = var.webapp_name
  x_azure_fdid                 = module.afd.frontDoorEndpointProfileGUID
}

module "afd" {
  source = "../modules/afd"
  front_door_sku_name = var.front_door_sku_name
  
}


