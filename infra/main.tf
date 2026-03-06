# -----------------------------------------------------------------------------
# Core composition file:
# - Resource Group
# - Modules: network, registry, AKS, monitoring
# - Role assignment for ACR pull
# -----------------------------------------------------------------------------

# Resource Group: logical container that holds all project resources.
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.location
}

# -----------------------------------------------------------------------------
# MODULES
# -----------------------------------------------------------------------------

module "network" {
  source              = "./modules/network"
  project_name        = var.project_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
  aks_subnet_prefix   = var.aks_subnet_prefix
}

module "registry" {
  source              = "./modules/registry"
  project_name        = var.project_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "aks" {
  source                 = "./modules/aks"
  project_name           = var.project_name
  location               = var.location
  resource_group_name    = azurerm_resource_group.rg.name
  subnet_id              = module.network.aks_subnet_id
  node_count             = 1
  node_vm_size           = "Standard_B2s"
  authorized_ip_ranges   = var.authorized_ip_ranges
  admin_group_object_ids = []
}

module "monitoring" {
  source              = "./modules/monitoring"
  project_name        = var.project_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  log_analytics_sku   = var.log_analytics_sku
  aks_id              = module.aks.aks_id
  acr_id              = module.registry.acr_id
}

# -----------------------------------------------------------------------------
# ACR pull permissions for AKS managed identity
# -----------------------------------------------------------------------------
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = module.registry.acr_id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.aks_kubelet_object_id
}
