variable "key_vault_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg" {
  type = string
}
variable "kubelet_identity_object_id" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "payment_gateway_api_key" {
  type      = string
  sensitive = true
}
