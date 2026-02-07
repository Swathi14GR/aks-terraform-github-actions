# Create Private Endpoint for ACR
resource "azurerm_private_endpoint" "acr_pe" {
  name                = "${var.acr_name}-pe"
  location            = var.location
  resource_group_name = var.rg
  subnet_id           = var.services_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.acr_name}-psc"
    private_connection_resource_id = var.id  #acrid
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
}

# Create Private DNS Zone for ACR
resource "azurerm_private_dns_zone" "acr_dns" {
  name                = "privatelink.azurecr.io"
  resource_group_name = var.rg
  tags                = var.tags
}

# Link Private DNS Zone to VNet
resource "azurerm_private_dns_zone_virtual_network_link" "acr_dns_link" {
  name                  = "${var.acr_name}-vnetlink"
  resource_group_name   = var.rg
  private_dns_zone_name = azurerm_private_dns_zone.acr_dns.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
  tags                  = var.tags
}

# Create A record in Private DNS pointing to PE IP
resource "azurerm_private_dns_a_record" "acr_pe_record" {
  name                = var.acr_name
  zone_name           = azurerm_private_dns_zone.acr_dns.name
  resource_group_name = var.rg
  ttl                 = 300
  records             = [azurerm_private_endpoint.acr_pe.private_service_connection[0].private_ip_address]
}

