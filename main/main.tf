provider "azurerm" {
    features {
    }
  
}
data "azurerm_client_config" "ravi" {
  
}
module "resource_group" {
    source = "../module/rg"
    rg_name = var.rg_name
    location = var.location
      
}
module "key_vault" {
    source = "../module/kv"
    kv_name = var.key_vault_name
    location = var.location
    tenant_id = data.azurerm_client_config.ravi.tenant_id
    object_id = data.azurerm_client_config.ravi.object_id
    depends_on = [
      module.resource_group
    ]
    resource_group_name = var.rg_name
}
module "aks_cluster" {
    source = "../module/aks"
    aks_name = var.aks_name
    location = var.location
    resource_group_name = var.rg_name
    depends_on = [
      module.resource_group
    ]
    
  
}

module "kv_secret" {
    source = "../module/kv_secret"
    depends_on = [
      module.key_vault , module.aks_cluster
    ]
  
  key_vault_id = module.key_vault.key_vault_id
  secret_names = {
    "aks-kube-config" = "module.aks.kube_config"
    "aks-certifcates" = "module.aks.client_certifcates"
  }
}