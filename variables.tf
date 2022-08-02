variable "availability_set_name" {
  type        = string
  description = "Name of the Availability Set"
}

variable "location" {
  type        = string
  description = "Azure region for resource deployment"
}

variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group resource will be deployed in"
}

variable "availability_set_tags" {
  type        = map(string)
  description = "Key/Value tags that should be added to the Availability Set"
  default     = {}
}

variable "regional_tags" {
  type        = map(string)
  description = "Regional level tags"
}

variable "global_tags" {
  type        = map(string)
  description = "Global level tags"
}