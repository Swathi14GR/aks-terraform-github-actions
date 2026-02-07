resource_group_name = "rg-aks-prod1"
environment         = "prod"
vnet_name           = "my-vnet"
aks_cluster_name    = "aks-prod"
acr_name            = "acrprodassignmnet3"
key_vault_name      = "kv-prod-1234"
log_analytics_name  = "law-prod"
vm_size             = "standard_d8_v3"


common_tags = {
  project    = "aks-demo"
  created_by = "terraform"
}