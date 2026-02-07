resource_group_name = "rg-aks-prod3"
environment         = "prod"
vnet_name           = "my-vnet"
aks_cluster_name    = "aks-prod"
acr_name            = "acrprodassignmnet6"
key_vault_name      = "kv-prod-1234demo2"
log_analytics_name  = "law-prod"
vm_size             = "standard_d8_v3"

common_tags = {
  project    = "aks-demo"
  created_by = "terraform"
}