# -----------------------------------------------------------------------------
# Outputs for AKS module
# -----------------------------------------------------------------------------

output "aks_id" {
  value = azurerm_kubernetes_cluster.this.id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "aks_principal_id" {
  value = azurerm_kubernetes_cluster.this.identity[0].principal_id
}

output "aks_kubelet_object_id" {
  value = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}
