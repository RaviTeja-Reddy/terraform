provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "resource_group" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}