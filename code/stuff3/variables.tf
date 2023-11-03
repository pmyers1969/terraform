variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "rg-testagain2"
}

variable "location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
  default     = "AustraliaSoutheast"
}

variable "vnets" {
  description = "list of all networks and subnets"
  type = list(object({
    vnet_name = string
    address_space = list(string)
    subnets = map(object({
      subnet_name = string
      cidr_block  = string
    }))
  }))
  default = [{
    vnet_name = "vnet100"
    address_space = [ "10.20.0.0/16" ]
    subnets = {
      "subnet1" = {
         subnet_name = "subnet1"
         cidr_block  = "10.20.0.0/24" 
      },
      "GatewaySubnet" = {
        subnet_name    = "GatewaySubnet"
        cidr_block     = "10.20.1.0/24"
      }  
    }
  },
  {
    vnet_name = "vnet101"
    address_space = [ "10.21.0.0/16" ]
    subnets = {
      "subnet2" = {
         subnet_name = "subnet2"
         cidr_block  = "10.21.0.0/24" 
      },
      "GatewaySubnet" = {
        subnet_name    = "GatewaySubnet"
        cidr_block     = "10.21.1.0/24"
      }  
    }
  }
  ]
}


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