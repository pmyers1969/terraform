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

variable "vnet_name" {
  type        = string
  description = "Virtual Network Name"
  default     = "default-vnet"
}

variable "vnet_address_space" {
  type        = string
  description = "Virtual Network Address Space"
  default     = "10.0.0.0/16"
}

variable "subnets" {
  type = map(any)
  default = {
    subnet_1 = {
      name             = "subnet_1"
      address_prefixes = ["10.0.1.0/24"]
    }
    subnet_2 = {
      name             = "subnet_2"
      address_prefixes = ["10.0.2.0/24"]
    }
    subnet_3 = {
      name             = "subnet_3"
      address_prefixes = ["10.0.3.0/24"]
    }
  }
}