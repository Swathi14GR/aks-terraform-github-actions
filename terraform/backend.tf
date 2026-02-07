terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfstateprodassigment"
    container_name       = "tfstate3"
    key                  = "infra.tfstate"
  }
}
