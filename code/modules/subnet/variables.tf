variable "subnet_name" {
  type              = string
}

variable "resource_group_name" {
    type            = string
  }

variable "address_prefix" {
  description = "Address prefix of the Subnet"
  type        = string
}

variable "vnet_id" {
  description = "ID of the VNet to which the subnet belongs"
  type        = string
}