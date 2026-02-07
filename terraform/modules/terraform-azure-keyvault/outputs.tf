output "uri" {
  value = azurerm_key_vault.kv.vault_uri
}

output "id" {
  description = "Resource ID of the Key Vault"
  value       = azurerm_key_vault.kv.id
}
output "name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.kv.name
}