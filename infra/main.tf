# -----------------------------------------------------------------------------
# Core Azure resources:
# - Resource Group
# - Azure Container Registry (ACR)
# -----------------------------------------------------------------------------

# Resource Group: logical container that holds all project resources.
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.location
}

# Azure Container Registry:
# Stores Docker images that will be used by the AKS cluster.
resource "azurerm_container_registry" "acr" {
  name                = "${var.project_name}acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # "Basic" is enough for demos and testing.
  sku = "Basic"

  # Enabled for easier development (not recommended for production).
  admin_enabled = false
}
