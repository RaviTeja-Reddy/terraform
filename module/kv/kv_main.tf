data "azurerm_client_config" "ravi" {
  
}

resource "azurerm_key_vault" "kv_name" {
    name = var.kv_name
    location = var.location
    resource_group_name = var.resource_group_name
    enabled_for_disk_encryption = true
    tenant_id = data.azurerm_client_config.ravi.tenant_id
    soft_delete_retention_days = 7
    purge_protection_enabled = false
    sku_name = "standard"
}

resource "azurerm_key_vault_access_policy" "kv_access_policy" {
    key_vault_id = azurerm_key_vault.kv_name.id
    tenant_id = var.tenant_id
    object_id = var.object_id
    key_permissions = [ "List", ]
    secret_permissions = [ "Set","Get","Delete","Purge","Recover" ]
}
