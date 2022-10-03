resource "azurerm_service_plan" "sp" {
    name = var.sp_name
    location = var.location
    resource_group_name = var.resource_group_name
    sku_name = "Y1"
    os_type = "Windows"
  
}