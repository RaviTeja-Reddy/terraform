output "primary_key" {
    value = azurerm_cosmosdb_account.db.primary_key
    sensitive = true 
}
output "secondary_key" {
    value = azurerm_cosmosdb_account.db.secondary_key
    sensitive = true
  
}