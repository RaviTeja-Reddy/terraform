resource "azurerm_storage_account" "storage" {
    name = var.st_name
    location = var.location
    tags = var.tags
    resource_group_name = var.resource_group_name
    account_tier = var.account_tier
    account_replication_type = var.account_replication_type
}