output "availability_set_id" {
  description = "The resource id of the Availability Set"
  value       = azurerm_availability_set.availability_set.id
}