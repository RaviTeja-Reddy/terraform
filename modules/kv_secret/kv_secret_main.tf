resource "azurerm_key_vault_secret" "kv_secret" {
    name = var.kv_secret_name
    value = var.key_vault_value
    key_vault_id = var.key_vault_id
  
}