data "azurerm_client_config" "current" {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.116.0"
    }
  }
}
resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.rg
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  tags                = var.tags
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    #ip_rules                   = ["10.0.0.0/24"]
    #virtual_network_subnet_ids = []
  }
}

resource "azurerm_key_vault_secret" "payment_gateway_api_key" {
  name         = "payment-gateway-api-key"
  value        = var.payment_gateway_api_key
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_creator
  ]
}

resource "azurerm_key_vault_access_policy" "terraform_creator" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id
  
  key_permissions = ["Get", "List", "Create", "Update", "Delete"]
  secret_permissions = ["Get", "List", "Set", "Delete"]
  certificate_permissions = ["Get", "List", "Create", "Update", "Delete"]
}

resource "azurerm_role_assignment" "aks_kv_reader" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.kubelet_identity_object_id       # From AKS module output
}