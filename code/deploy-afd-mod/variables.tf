variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "australiasoutheast"
}

variable "app_service_plan_name" {
    type         = string
    description  = "Name of the App Service Plan"
    default      = "asp-test-999"
  }

variable "app_service_plan_sku_name" {
  type        = string
  description = "The SKU for the plan. Possible values include: B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, I4v2, I5v2, I6v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, P1mv3, P2mv3, P3mv3, P4mv3, P5mv3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, Y1."
  default     = "S1"
  validation {
    condition     = contains(["B1", "B2", "B3", "D1", "F1", "I1", "I2", "I3", "I1v2", "I2v2", "I3v2", "I4v2", "I5v2", "I6v2", "P1v2", "P2v2", "P3v2", "P0v3", "P1v3", "P2v3", "P3v3", "P1mv3", "P2mv3", "P3mv3", "P4mv3", "P5mv3", "S1", "S2", "S3", "SHARED", "EP1", "EP2", "EP3", "WS1", "WS2", "WS3", "Y1"], var.app_service_plan_sku_name)
    error_message = "The SKU value must be one of the following: B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, I4v2, I5v2, I6v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, P1mv3, P2mv3, P3mv3, P4mv3, P5mv3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, Y1."
  }
}

variable "app_service_plan_capacity" {
  type        = number
  description = "The number of Workers (instances) to be allocated."
  default     = 1
}

variable "webapp_name" {
    type            = string
    description = "Name of WebApp"
    default     = "webapp-test-999"
  }

variable "front_door_sku_name" {
  type        = string
  description = "The SKU for the Front Door profile. Possible values include: Standard_AzureFrontDoor, Premium_AzureFrontDoor"
  default     = "Standard_AzureFrontDoor"
  validation {
    condition     = contains(["Standard_AzureFrontDoor", "Premium_AzureFrontDoor"], var.front_door_sku_name)
    error_message = "The SKU value must be one of the following: Standard_AzureFrontDoor, Premium_AzureFrontDoor."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name."
  default     = "rg-test-afd"
}

variable "x_azure_fdid" {
  type        = string
} 


variable "ARM_CLIENT_ID" {
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  type        = string
}

variable "ARM_SUBSCRIPTION_ID" {
  type        = string
}

variable "ARM_TENANT_ID" {
  type        = string
}
