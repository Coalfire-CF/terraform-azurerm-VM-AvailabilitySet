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

variable "tags" {
  type        = map(string)
  description = "Tags for the Availability Set, merged with regional_tags and global_tags."
  default     = {}
}

variable "regional_tags" {
  type        = map(string)
  description = "Regional level tags"
  default     = {}
}

variable "global_tags" {
  type        = map(string)
  description = "Global level tags"
  default     = {}
}
