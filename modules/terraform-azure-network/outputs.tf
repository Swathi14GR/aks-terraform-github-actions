output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "services_subnet_id" {
  value = azurerm_subnet.services.id
}
