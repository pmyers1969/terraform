variable "location" {
  type        = string
  default     = "australiasoutheast"  
  description = "The Azure location where all resources in this example should be created"
}

variable "rg_name" {
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
