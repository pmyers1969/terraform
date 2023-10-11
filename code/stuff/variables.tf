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


  variable "nested_map" {
  type = map(any)
  default = {
    "group:manager@flatten.com" = [
      "roles/viewer",
      "roles/editor"
    ],
    "group:developer@flatten.com" = [
      "roles/viewer",
    ],
    "group:opertaions@flatten.com" = [
      "roles/owner",
      "roles/admin",
    ],
  }
}