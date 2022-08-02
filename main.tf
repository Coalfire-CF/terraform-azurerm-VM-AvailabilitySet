resource "azurerm_availability_set" "availability_set" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_update_domain_count = 2
  platform_fault_domain_count  = 2
  tags                         = merge(var.availability_set_tags, var.regional_tags, var.global_tags)
}