# -----------------------------------------------------------------------------
# Azure Kubernetes Service (AKS)
# -----------------------------------------------------------------------------
# Goal:
# - Managed Kubernetes cluster with Azure CNI powered by Cilium and RBAC.
# - Uses system-assigned identity for ACR pull and add-ons.
# -----------------------------------------------------------------------------

resource "azurerm_kubernetes_cluster" "this" {
  name                = "${var.project_name}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = "${var.project_name}-aks"
  sku_tier   = "Free"

  azure_policy_enabled      = true
  automatic_channel_upgrade = "patch"

  default_node_pool {
    name                   = "default"
    node_count             = var.node_count
    vm_size                = var.node_vm_size
    vnet_subnet_id         = var.subnet_id
    max_pods               = 50
    enable_host_encryption = true
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "cilium"
    network_data_plane = "cilium"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = var.admin_group_object_ids
  }

  api_server_access_profile {
    authorized_ip_ranges = var.authorized_ip_ranges
  }
}
