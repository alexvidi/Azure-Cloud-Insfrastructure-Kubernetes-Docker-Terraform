# -----------------------------------------------------------------------------
# Virtual Network + Subnet for AKS (Azure CNI)
# -----------------------------------------------------------------------------
# Goal:
# - Provide an isolated address space for the cluster.
# - Delegate the subnet to Microsoft.ContainerService for Azure CNI.
# -----------------------------------------------------------------------------

resource "azurerm_virtual_network" "this" {
  name                = "${var.project_name}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = [var.address_space]
}

resource "azurerm_subnet" "aks" {
  name                 = "${var.project_name}-aks-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.aks_subnet_prefix]
}
