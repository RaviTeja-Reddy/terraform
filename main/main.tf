provider "azurerm" {
    features {
      
    }
  
}

module "resource_group" {
    source = "../modules/rg"
    rg_name = var.rg_name
    location = var.location
    tags= var.tags
}
module "storage_account" {
    source = "../modules/st"
    storage_account_name = var.st_name
    location = var.location
    resource_group_name = var.rg_name
    depends_on = [
      module.resource_group
    ]
  
}
module "service_plan" {
    source = "../modules/sp"
    location = var.location
    sp_name = var.sp_name
    resource_group_name = var.rg_name
    depends_on = [
      module.resource_group
    ]
  
}
module "function_app" {
    source = "../modules/fa"
    fapp = var.fapp_name
    location = var.location
    resource_group_name = var.rg_name
    storage_account_name = var.st_name
    storage_account_access_key = module.storage_account.primary_access_key
    service_plan_id = module.service_plan.app_service_id
    depends_on = [
      module.storage_account
    ]
}