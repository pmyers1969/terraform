variable "ARM_CLIENT_ID" {
  type = string
}

variable "ARM_CLIENT_SECRET" {
  type = string
}

variable "ARM_SUBSCRIPTION_ID" {
  type = string
}

variable "ARM_TENANT_ID" {
  type = string
}


variable "resource_group_name" {
  type        = string
  description = "Resource Group Name."
  default     = "rg-test-afd"
}

variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "australiasoutheast"
}

variable "vnets" {
  description     = "Map of VNets and their subnets"
  type            = map(object({
    address_space = string
    subnets       = list(string)
  }))
  default = {
    "vnet1" = {
      address_space = "10.0.0.0/16"
      subnets       = ["subnet_1", "subnet_2","subnet_3"]
      }
    
    "vnet2" = {
      address_space = "10.1.0.0/16"
      subnets       = ["subnet_4", "subnet_5"]
      }
    }
  }



