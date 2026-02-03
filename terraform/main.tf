resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source   = "./modules/terraform-azure-network"
  location           = var.location
  rg                 = var.resource_group_name
  vnet_name          = var.vnet_name
}

module "loganalytics" {
  source = "./modules/terraform-azure-loganalytics"
  location           = var.location
  rg                 = var.resource_group_name
  law_name           = var.log_analytics_name
  
}

module "aks" {
  source             = "./modules/terraform-azure-aks"
  aks_subnet_id      = module.network.aks_subnet_id
  log_analytics_id   = module.loganalytics.id
  location           = var.location
  rg                 = var.resource_group_name
  cluster_name       = var.aks_cluster_name
}

module "keyvault" {
  source         = "./modules/terraform-azure-keyvault"
  location       = var.location
  rg             = var.resource_group_name
  key_vault_name = var.key_vault_name
  kubelet_identity_object_id = module.aks.kubelet_identity_object_id 
}

module "acr" {
  source      = "./modules/terraform-azure-acr"
  location    = var.location
  rg     = var.resource_group_name
  acr_name    = var.acr_name
}
