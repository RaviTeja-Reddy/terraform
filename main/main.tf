provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }

  }

}
data "azurerm_client_config" "current" {}

module "resource_group" {
  source   = "../modules/rg"
  rg_name  = var.rg_name
  location = var.location
  tags     = var.tags
}
module "storage_account" {
  source               = "../modules/st"
  storage_account_name = var.st_name
  location             = var.location
  resource_group_name  = var.rg_name
  depends_on = [
    module.resource_group
  ]

}
module "service_plan" {
  source              = "../modules/sp"
  location            = var.location
  sp_name             = var.sp_name
  resource_group_name = var.rg_name
  depends_on = [
    module.resource_group
  ]

}
module "function_app" {
  source                     = "../modules/fa"
  fapp                       = var.fapp_name
  location                   = var.location
  resource_group_name        = var.rg_name
  storage_account_name       = var.st_name
  storage_account_access_key = module.storage_account.primary_access_key
  service_plan_id            = module.service_plan.app_service_id
  depends_on = [
    module.storage_account
  ]
}
module "key_vault" {
  source = "../modules/keyvault"
  depends_on = [
    module.resource_group
  ]
  kv_name             = var.key_vault_name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id

}
module "cosmos_db" {
  source              = "../modules/cosmos_db"
  location            = var.location
  resource_group_name = var.rg_name
  depends_on = [
    module.key_vault
  ]

}
module "key_vault_secret" {
  source       = "../modules/key_secret"
  depends_on   = [module.key_vault, module.cosmos_db]
  key_vault_id = module.key_vault.key_vault_id
  secret_names = {
    "cosmos-db-primary-key"   = "module.cosmosdb_account.primary_key"
    "cosmos-db-secondary-key" = "module.cosmosdb_account.secondary_key"

  }
}