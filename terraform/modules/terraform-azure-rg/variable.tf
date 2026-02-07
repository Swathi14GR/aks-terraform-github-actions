variable "rg" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  type = string
}
variable "tags" {
  type = map(string)
}