###############################
# Resource Group
###############################
module "rg" {
  source   = "./modules/terraform-azure-rg"
  name     = var.resource_group_name
  location = var.location
}
###############################
# Network Module
###############################
module "network" {
  source    = "./modules/terraform-azure-network"
  location  = var.location
  rg        = module.rg.name
  vnet_name = var.vnet_name
}

###############################
# Log Analytics Module
###############################
module "loganalytics" {
  source   = "./modules/terraform-azure-loganalytics"
  location = var.location
  rg       = module.rg.name
  law_name = var.log_analytics_name
}

###############################
# AKS Module
###############################
module "aks" {
  source           = "./modules/terraform-azure-aks"
  aks_subnet_id    = module.network.aks_subnet_id
  log_analytics_id = module.loganalytics.id
  location         = var.location
  rg               = module.rg.name
  cluster_name     = var.aks_cluster_name
}

###############################
# Key Vault Module
###############################
module "keyvault" {
  source                     = "./modules/terraform-azure-keyvault"
  location                   = var.location
  rg                         = module.rg.name
  key_vault_name             = var.key_vault_name
  kubelet_identity_object_id = module.aks.kubelet_identity_object_id
}

###############################
# ACR Module
###############################
module "acr" {
  source   = "./modules/terraform-azure-acr"
  location = var.location
  rg       = module.rg.name
  acr_name = var.acr_name
}
