data "azurerm_client_config" "ravi" {
  
}
resource "azurerm_key_vault" "kv" {
    name = var.kv_name
    location = var.location
    resource_group_name = var.resource_group_name
    tenant_id = data.azurerm_client_config.ravi.tenant_id
    sku_name = "premium"
    soft_delete_retention_days = 7
}
resource "azurerm_key_vault_access_policy" "acp" {
    key_vault_id = azurerm_key_vault.kv.id
    tenant_id = data.azurerm_client_config.ravi.tenant_id
    object_id = data.azurerm_client_config.ravi.object_id
    key_permissions = [ "Create" , "Get" , "List" ,]
    secret_permissions = [ "Set" , "Get" , "Delete" , "Purge" , "Recover", "List" ]
    
}
