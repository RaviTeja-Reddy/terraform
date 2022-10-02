resource "azurerm_windows_function_app" "fapp" {
    name = var.fa_name
    location = var.location
    resource_group_name = var.resource_group_name
    storage_account_name = var.storage_account_name
    storage_account_access_key = var.storage_account_access_key
    service_plan_id = var.service_plan_id
    site_config {
      
    }
  
}