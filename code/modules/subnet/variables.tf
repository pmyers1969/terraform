variable "subnets" {
  type = map(any)
}

variable "resource_group_name" {
    type            = string
  }

variable "vnet_name" {
    type            = string
    description = "Virtual Network Name"
}