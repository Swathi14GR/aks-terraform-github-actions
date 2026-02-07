variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group for AKS resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "key_vault_name" {
  description = "Azure Key Vault name"
  type        = string
}

variable "log_analytics_name" {
  description = "Log Analytics Workspace name"
  type        = string
}

variable "vnet_name" {
  description = "vnet_name"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "payment_gateway_api_key" {
  description = "API key for payment gateway"
  type        = string
  sensitive   = true
}
