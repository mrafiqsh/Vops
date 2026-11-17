terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Existing Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

# New Resource Group for Storage
resource "azurerm_resource_group" "storage_rg" {
  name     = var.storage_rg_name
  location = var.location

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Purpose     = "Storage"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_resource_group_name" {
  value = azurerm_resource_group.storage_rg.name
}
