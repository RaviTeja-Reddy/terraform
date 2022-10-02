output "storage_account_name" {
    value = azurerm_storage_account.st.name
  
}
output "primary_access_key" {
    value = azurerm_storage_account.st.primary_access_key
    sensitive = true
  
}