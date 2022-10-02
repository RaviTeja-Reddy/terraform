provider "azurerm" {
    features {
      
    }
  
}
module "resource_group" {
    source = "../modules/rg"
    rg_name = var.rg_name
    location = var.location 
}
module "storage_account" {
    source = "../modules/st"
    st_name = var.st_name
    location = var.location
    resource_group_name = module.resource_group.resource_group_name
    depends_on = [
      module.resource_group
    ]
  
}
module "service_plan" {
    source = "../modules/sp"
    resource_group_name = module.resource_group.resource_group_name
    sp_name = var.sp_name
    location = var.location
    depends_on = [
      module.resource_group
    ]
  
}
module "function_app" {
  source = "../modules/fa"
  depends_on = [
    module.storage_account
  ]
  location = var.location
  fa_name = var.fapp_name
  resource_group_name = module.resource_group.resource_group_name
  storage_account_name = module.storage_account.storage_account_name
  storage_account_access_key = module.storage_account.primary_access_key
  service_plan_id = module.service_plan.service_plan_id
  
}

module "cosmosdb_account" {
  source = "../modules/cosmos_db"
  location = var.location
  cosmos_db_name = var.cosmosdb_account_name
  resource_group_name = module.resource_group.resource_group_name
  depends_on = [
    module.resource_group
  ]
  
}

module "aks_cluster" {
  source = "../modules/aks"
  depends_on = [
    module.resource_group
  ]
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  aks_name = var.aks_cluster_name
  
}

module "key_vault" {
  source = "../modules/kv"
  depends_on = [
    module.resource_group
  ]
  kv_name = var.key_vault_name
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  
  
}

module "key_vault_secret" {
  source = "../modules/kv_secret"
  kv_secret_name = var.key_vault_secret_name
  key_vault_value = var.key_vault_secret_value
  depends_on = [
    module.key_vault
  ]
  key_vault_id = module.key_vault.key_vault_id
}