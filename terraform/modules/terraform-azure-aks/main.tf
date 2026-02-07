resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.rg
  dns_prefix          = "aks-private"
  tags                = var.tags

  role_based_access_control_enabled = true
  private_cluster_enabled           = true
  private_dns_zone_id               = "System"

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
    network_policy = "azure"
    service_cidr   = "10.1.0.0/16"
    dns_service_ip = "10.1.0.10"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_id
  }
}