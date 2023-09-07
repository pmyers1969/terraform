
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


module "appservice" {
  source = "../modules/appservice"
  resource_group_name          = azurerm_resource_group.rg.name
  resource_group_location      = azurerm_resource_group.rg.location
  app_service_plan_name        = var.app_service_plan_name
  app_service_plan_sku_name    = var.app_service_plan_sku_name
  app_service_plan_capacity    = var.app_service_plan_capacity
  webapp_name                  = var.webapp_name
  dependencies = [ 
    module.afd.depended_on
   ]
}

module "afd" {
  source = "../modules/afd"
  front_door_sku_name = var.front_door_sku_name
  dependencies = [
    module.appservice.depended_on
  ]
}


