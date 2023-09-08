# variables for module
variable "resource_group_name" {
    type            = string
  }

variable "resource_group_location" {
    type            = string
  }

variable "app_service_plan_name" {
    type            = string
  }

variable "app_service_plan_capacity" {
    type            = string
  }

variable "app_service_plan_sku_name" {
    type            = string
  }

variable "webapp_name" {
    type            = string
  }

variable "dependencies" {
    type    = list(string)
    default = []
}