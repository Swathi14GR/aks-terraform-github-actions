output "private_endpoint_id" {
  value = azurerm_private_endpoint.acr_pe.id
}

output "private_ip" {
  value = azurerm_private_endpoint.acr_pe.private_service_connection[0].private_ip_address
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.acr_dns.id
}
