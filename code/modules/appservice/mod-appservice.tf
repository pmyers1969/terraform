#Module for App Service


resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  sku_name            = var.app_service_plan_sku_name
  os_type             = "Windows"
  worker_count        = var.app_service_plan_capacity
}

resource "azurerm_windows_web_app" "app" {
  name                = var.webapp_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  https_only = true

  site_config {
    ftps_state          = "Disabled"
    minimum_tls_version = "1.2"
    ip_restriction {
      service_tag               = "AzureFrontDoor.Backend"
      ip_address                = null
      virtual_network_subnet_id = null
      action                    = "Allow"
      priority                  = 100
      headers {
        x_azure_fdid      = []
        x_fd_health_probe = []
        x_forwarded_for   = []
        x_forwarded_host  = []
      }
      name = "Allow traffic from Front Door"
    }
  }
}
