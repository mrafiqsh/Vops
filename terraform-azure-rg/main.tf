resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
}

resource "azurerm_resource_group" "storage_rg" {
  name     = var.storage_rg_name
  location = var.location
}
