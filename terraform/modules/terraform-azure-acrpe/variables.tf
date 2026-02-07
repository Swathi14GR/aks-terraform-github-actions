variable "id" {
  type        = string
  description = "The ID of the Azure Container Registry"
}

variable "acr_name" {
  type        = string
  description = "Name of the ACR"
}

variable "rg" {
  type        = string
  description = "Resource Group for PE and DNS"
}

variable "location" {
  type        = string
  description = "Location of resources"
}

variable "vnet_id" {
  type        = string
  description = "VNet ID where PE should reside"
}

variable "services_subnet_id" {
  type        = string
  description = "Subnet ID where PE should be placed"
}

variable "tags" {
  type = map(string)
}
