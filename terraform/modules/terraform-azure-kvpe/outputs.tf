output "private_endpoint_id" {
  description = "Key Vault Private Endpoint resource ID"
  value       = azurerm_private_endpoint.kv_pe.id
}

output "private_endpoint_ip" {
  description = "Private IP assigned to the Key Vault Private Endpoint"
  value       = azurerm_private_endpoint.kv_pe.private_service_connection[0].private_ip_address
}

output "private_dns_zone_id" {
  description = "Private DNS Zone ID for Key Vault"
  value       = azurerm_private_dns_zone.kv_dns.id
}

output "private_dns_zone_name" {
  description = "Private DNS Zone name for Key Vault"
  value       = azurerm_private_dns_zone.kv_dns.name
}
