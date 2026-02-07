output "uri" {
  value = azurerm_key_vault.kv.vault_uri
}
output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}
output "name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.kv.name
}