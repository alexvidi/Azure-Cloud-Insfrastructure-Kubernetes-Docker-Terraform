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
  value = module.registry.acr_login_server
}

# Name of the AKS cluster.
output "aks_cluster_name" {
  value = module.aks.aks_name
}

# Log Analytics workspace ID.
output "log_analytics_workspace_id" {
  value = module.monitoring.log_analytics_workspace_id
}

# VNet and subnet identifiers.
output "vnet_id" {
  value = module.network.vnet_id
}

output "aks_subnet_id" {
  value = module.network.aks_subnet_id
}

