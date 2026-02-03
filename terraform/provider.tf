terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.116.0"
    }
  }
   required_version =">=1.0"

}
provider "azurerm" {
  features {}
    subscription_id = "68e2c246-52c7-49bf-a5b9-cd2de751cce9"
    tenant_id ="02ca8455-9d06-4642-a6e2-1b156d932757"
}
