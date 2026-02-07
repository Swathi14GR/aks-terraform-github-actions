variable "cluster_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg" {
  type = string
}

variable "aks_subnet_id" {
  description = "Subnet ID for AKS nodes"
  type        = string
}

variable "log_analytics_id" {
  description = "Log Analytics Workspace ID"
  type        = string
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_D4s_v5"
}
variable "tags" {
  type = map(string)
}