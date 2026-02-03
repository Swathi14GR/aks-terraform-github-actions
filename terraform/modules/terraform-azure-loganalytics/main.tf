
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  retention_in_days   = 30
}
