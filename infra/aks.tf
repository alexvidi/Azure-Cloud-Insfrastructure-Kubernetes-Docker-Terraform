# -----------------------------------------------------------------------------
# Azure Kubernetes Service (AKS) cluster
# -----------------------------------------------------------------------------
# This managed Kubernetes cluster will run our Dockerized FastAPI app.
# -----------------------------------------------------------------------------

resource "azurerm_kubernetes_cluster" "aks" {
  # Cluster name based on project_name.
  name                = "${var.project_name}-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  # Used to build the AKS API server DNS name.
  dns_prefix = "${var.project_name}-aks"

  # Default node pool configuration.
  default_node_pool {
    # Node pool name inside the cluster.
    name = "default"

    # For this demo, 1 node is enough.
    node_count = 1

    # Small VM size suitable for light workloads.
    vm_size = "Standard_B2s"
  }

  # System-assigned managed identity for secure access to other Azure services.
  identity {
    type = "SystemAssigned"
  }
}


