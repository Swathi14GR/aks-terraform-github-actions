
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.rg
  dns_prefix          = "aks-private"
  #sku_tier ="Free"
  #kubernetes_version  = "1.28"  
  private_cluster_enabled = true

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "standard_d8_v3" #"standard_d4_v5" 
    vnet_subnet_id = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_id
  }
}
