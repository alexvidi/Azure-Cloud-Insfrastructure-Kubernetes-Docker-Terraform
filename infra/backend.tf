terraform {
  backend "azurerm" {
    resource_group_name  = "alexdevops99-tfstate-rg"
    storage_account_name = "alexdevops99tfstate01"
    container_name       = "tfstate"
    key                  = "aks-fastapi.tfstate"
  }
}
