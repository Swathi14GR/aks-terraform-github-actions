variable "key_vault_id" {
  description = "Key Vault resource ID"
  type        = string
}

variable "kv_name" {
  description = "Key Vault name"
  type        = string
}

variable "rg" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_id" {
  type        = string
  description = "VNet ID to link the Private DNS Zone"
}

variable "services_subnet_id" {
  type        = string
  description = "Subnet ID where PE should be placed"
}

variable "tags" {
  type = map(string)
}

