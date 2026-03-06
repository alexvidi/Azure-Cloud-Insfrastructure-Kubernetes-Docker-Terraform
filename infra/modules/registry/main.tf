# -----------------------------------------------------------------------------
# Azure Container Registry (ACR)
# -----------------------------------------------------------------------------
# Goal:
# - Store Docker images for the AKS cluster.
# - Keep admin disabled; rely on managed identities.
# -----------------------------------------------------------------------------

resource "azurerm_container_registry" "this" {
  name                = "${var.project_name}acr"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = "Basic"
  admin_enabled = false
}
