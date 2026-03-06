# -----------------------------------------------------------------------------
# Azure Kubernetes Service (AKS)
# -----------------------------------------------------------------------------
# Goal:
# - Managed Kubernetes cluster with Azure CNI powered by Cilium and RBAC.
# - Uses system-assigned identity for ACR pull and add-ons.
# -----------------------------------------------------------------------------

resource "azurerm_kubernetes_cluster" "this" {
  #checkov:skip=CKV_AZURE_117: This lab does not provision a customer-managed disk encryption set.
  #checkov:skip=CKV_AZURE_115: The cluster API remains public so GitHub-hosted runners can deploy without private network access.
  #checkov:skip=CKV_AZURE_232: The lab intentionally uses a single small system pool instead of separate system and user pools.
  #checkov:skip=CKV_AZURE_4: AKS and ACR diagnostics already flow to Log Analytics, and app metrics are collected via Prometheus/Grafana.
  #checkov:skip=CKV_AZURE_6: Authorized API server IP ranges are left open because GitHub-hosted runner egress IPs are not stable.
  #checkov:skip=CKV_AZURE_172: Secrets Store CSI rotation is not enabled because this project does not use the CSI driver or Azure Key Vault integration.
  #checkov:skip=CKV_AZURE_170: The cluster uses the Free SKU because this repository targets lab and portfolio scenarios rather than paid production SLA.
  #checkov:skip=CKV_AZURE_141: Local admin access remains enabled because the GitHub deployment workflow retrieves AKS admin credentials.
  #checkov:skip=CKV_AZURE_226: Ephemeral OS disks are not used because the selected entry-level VM size is kept for cost control in the lab environment.
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
