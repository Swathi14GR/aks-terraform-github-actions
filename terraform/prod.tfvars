resource_group_name = "rg-aks-demo"
environment         = "prod"
vnet_name           = "my-vnet"
aks_cluster_name    = "aks-prod"
acr_name            = "acrprodassignmnet6"
key_vault_name      = "kv-prod-demo-12345"
log_analytics_name  = "law-prod"
vm_size             = "standard_d8_v3"
runner_vnet_name    = "vnet-eastus"

common_tags = {
  project    = "aks-demo"
  created_by = "terraform"
}