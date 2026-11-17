output "resource_group_name" {
  description = "Name of the application resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "ID of the application resource group"
  value       = azurerm_resource_group.rg.id
}

output "storage_resource_group_name" {
  description = "Name of the storage resource group"
  value       = azurerm_resource_group.storage_rg.name
}

output "storage_resource_group_id" {
  description = "ID of the storage resource group"
  value       = azurerm_resource_group.storage_rg.id
}
