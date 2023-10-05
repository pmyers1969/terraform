variable "vnets" {
    type            = map(any)
    description = "Virtual Network Names"
}

variable "address_space" {
    type            = string
    description = "Virtual Network Address Space"
}

variable "resource_group_name" {
    type            = string
  }

variable "resource_group_location" {
    type            = string
  }