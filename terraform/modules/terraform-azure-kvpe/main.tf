data "azurerm_virtual_network" "runner" {
  name                = var.runner_vnet_name
  resource_group_name = var.rg
}


########################################
# Private DNS Zone for Key Vault
########################################
resource "azurerm_private_dns_zone" "kv_dns" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.rg
  tags                = var.tags
}

########################################
# Link Private DNS Zone to VNet
########################################
resource "azurerm_private_dns_zone_virtual_network_link" "kv_dns_link" {
  name                  = "${var.kv_name}-vnetlink"
  resource_group_name   = var.rg
  private_dns_zone_name = azurerm_private_dns_zone.kv_dns.name
  virtual_network_id    = data.azurerm_virtual_network.runner.id
  registration_enabled  = false
  tags                  = var.tags
}

########################################
# Private Endpoint for Key Vault
########################################
resource "azurerm_private_endpoint" "kv_pe" {
  name                = "${var.kv_name}-pe"
  location            = var.location
  resource_group_name = var.rg
  subnet_id           = var.services_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.kv_name}-psc"
    private_connection_resource_id = var.kv_id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  # Auto-manage DNS records in the private DNS zone
  private_dns_zone_group {
    name                 = "${var.kv_name}-pdzg"
    private_dns_zone_ids = [azurerm_private_dns_zone.kv_dns.id]
  }
}
