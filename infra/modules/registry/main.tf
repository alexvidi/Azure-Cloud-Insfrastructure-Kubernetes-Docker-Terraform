# -----------------------------------------------------------------------------
# Azure Container Registry (ACR)
# -----------------------------------------------------------------------------
# Goal:
# - Store Docker images for the AKS cluster.
# - Keep admin disabled; rely on managed identities.
# -----------------------------------------------------------------------------

resource "azurerm_container_registry" "this" {
  #checkov:skip=CKV_AZURE_163: Image vulnerability scanning is enforced in CI with Trivy instead of enabling additional paid registry scanning features.
  #checkov:skip=CKV_AZURE_237: Dedicated data endpoints require Premium ACR, which is intentionally out of scope for this lab.
  #checkov:skip=CKV_AZURE_165: Geo-replication is unnecessary because the project deploys to a single Azure region.
  #checkov:skip=CKV_AZURE_139: Public network access remains enabled so GitHub-hosted runners and the lab cluster can push and pull images without private endpoints.
  #checkov:skip=CKV_AZURE_166: Quarantine and image verification features require a more advanced registry tier than this lab intentionally uses.
  #checkov:skip=CKV_AZURE_164: Trusted image enforcement is handled in CI/CD rather than with Premium ACR content trust features.
  #checkov:skip=CKV_AZURE_167: Untagged manifest retention is not configured because the registry uses the low-cost Basic tier for demo purposes.
  #checkov:skip=CKV_AZURE_233: Zone redundancy is only available on higher ACR tiers and is intentionally omitted in this single-region lab.
  name                = "${var.project_name}acr"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = "Basic"
  admin_enabled = false
}
