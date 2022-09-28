terraform {
  backend "azurerm" {
    resource_group_name  = "ravi_rg_back"
    storage_account_name = "ravibackend"
    container_name       = "backendconti"
    key                  = "prod.terraform.tfstate"
  }
}
