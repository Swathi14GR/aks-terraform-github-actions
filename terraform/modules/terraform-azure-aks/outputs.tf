output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
output "name" {
  value = azurerm_kubernetes_cluster.aks.name
}
#output "kubelet_identity_object_id" {
 # description = "Object ID of the kubelet managed identity (used for ACR pulls)"
 # value = azurerm_kubernetes_cluster.aks.identity_profile[0].kubeletidentity[0].object_id
#}