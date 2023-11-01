variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "rg-testagain"
}

variable "location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
  default     = "AustraliaSoutheast"
}

variable "vnets" {
  type = map(object({
    address_space = list(string)
    subnets = map(object({
      subnet_name = string
      cidr_block = string 
    }))
  }))
  default = {
    "bupavnet1"               = {
      address_space         = ["192.168.0.0/16"]
      subnets               = {
        "subnet1_bupavnet1" = {
           subnet_name      = "subnet1_bupavnet1"
           cidr_block       = ["192.168.0.0/24"]
        }
      }
    },
    "bupavnet2"               = {
      address_space         = ["10.0.0.0/16"]
      subnets               = {
        "subnet1_bupavnet2"   = {
           subnet_name      = "subnet1_bupavnet2"
           cidr_block       = ["10.0.2.0/24"]
        }
        "subnet2_bupavnet2"   = {
           subnet_name      = "subnet2_bupavnet2"
           cidr_block       = ["10.0.3.0/24"]
        }
      }
    },
    "bupavnet3"               = {
      address_space         = ["10.80.0.0/16"]
      subnets               = {
        "subnet1_bupavnet3"   = {
           subnet_name      = "subnet1_bupavnet3"
           cidr_block       = ["10.80.2.0/24"]
        },
        "subnet2_bupavnet3"   = {
           subnet_name      = "subnet2_bupavnet3"
           cidr_block       = ["10.80.1.0/24"]
        },
        "GatewaySubnet"       = {
           subnet_name      = "GatewaySubnet"
           cidr_block       = ["10.80.0.0/24"]
        }
      }
    },
    "bupavnet4"               = {
      address_space         = ["10.81.0.0/16"]
      subnets               = {
        "subnet1_bupavnet4" = {
           subnet_name      = "subnet1_bupavnet4"
           cidr_block       = ["10.81.0.0/24"]
        }
      }
    }
  }
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