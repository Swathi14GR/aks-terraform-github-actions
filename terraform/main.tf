###############################
# Resource Group
###############################
module "resourcegroup" {
  source   = "./modules/terraform-azure-rg"
  rg       = var.resource_group_name
  location = var.location
  tags     = local.tags
}
###############################
# Network Module
###############################
module "network" {
  source    = "./modules/terraform-azure-network"
  location  = var.location
  rg        = module.resourcegroup.name
  vnet_name = var.vnet_name
  tags     = local.tags
}

###############################
# Log Analytics Module
###############################
module "loganalytics" {
  source   = "./modules/terraform-azure-loganalytics"
  location = var.location
  rg       = module.resourcegroup.name
  law_name = var.log_analytics_name
  tags     = local.tags
}

###############################
# AKS Module
###############################
module "aks" {
  source           = "./modules/terraform-azure-aks"
  aks_subnet_id    = module.network.aks_subnet_id
  vnet_id          = module.network.vnet_id
  log_analytics_id = module.loganalytics.id
  location         = var.location
  rg               = module.resourcegroup.name
  cluster_name     = var.aks_cluster_name
  tags             = local.tags
}

###############################
# Key Vault Module
###############################
module "keyvault" {
  source                     = "./modules/terraform-azure-keyvault"
  location                   = var.location
  rg                         = module.resourcegroup.name
  key_vault_name             = var.key_vault_name
  kubelet_identity_object_id = module.aks.kubelet_identity_object_id
  payment_gateway_api_key    = var.payment_gateway_api_key
  tags                       = local.tags
}

###############################
# ACR Module
###############################
module "acr" {
  source   = "./modules/terraform-azure-acr"
  location = var.location
  rg       = module.resourcegroup.name
  acr_name = var.acr_name
  tags     = local.tags
}

###############################
# ACRPE Module
###############################

module "acr_pe" {
  source             = "./modules/terraform-azure-acrpe"
  id                 = module.acr.id
  acr_name           = var.acr_name
  rg                 = module.resourcegroup.name
  location           = var.location
  vnet_id            = module.network.vnet_id
  services_subnet_id = module.network.services_subnet_id
  tags               = local.tags
}

###############################
# KVPE Module
###############################

module "keyvault_pe" {
  source    = "./modules/terraform-azure-kvpe"

  kv_id             = module.keyvault.id
  kv_name           = var.key_vault_name
  rg                = module.resourcegroup.name
  location          = var.location

  services_subnet_id = module.network.services_subnet_id
  vnet_id            = module.network.vnet_id

  tags               = local.tags
}
