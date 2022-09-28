provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "ravi" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "ravi" {
  name                     = var.st_name
  resource_group_name      = azurerm_resource_group.ravi.name
  location                 = azurerm_resource_group.ravi.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}