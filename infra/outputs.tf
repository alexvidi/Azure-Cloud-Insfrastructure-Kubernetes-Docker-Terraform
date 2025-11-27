# -----------------------------------------------------------------------------
# Terraform outputs
# -----------------------------------------------------------------------------
# These values are printed after "terraform apply".
# They are useful for CLI commands and for checking resource names quickly.
# -----------------------------------------------------------------------------

# Name of the Resource Group.
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Login server URL of the Azure Container Registry.
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

# Name of the AKS cluster.
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

