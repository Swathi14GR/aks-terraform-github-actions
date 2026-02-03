#terraform {
  #backend "azurerm" {
    #resource_group_name  = "tf-state-rg"
    #storage_account_name = "tfstateprod123"
    #container_name       = "tfstate"
    #key                  = "aks/terraform.tfstate"
  #}
#}
