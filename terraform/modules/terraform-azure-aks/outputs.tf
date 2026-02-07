output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.aks_dns.id
}
