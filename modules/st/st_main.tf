resource "azurerm_storage_account" "st" {
    name = var.st_name
    location = var.location
    resource_group_name = var.resource_group_name
    account_tier = "Standard"
    account_replication_type = "GRS"
  
}