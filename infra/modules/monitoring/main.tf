# -----------------------------------------------------------------------------
# Observability baseline: Log Analytics + Diagnostic Settings
# -----------------------------------------------------------------------------
# Goal:
# - Centralize AKS and ACR logs/metrics in Log Analytics.
# - Lightweight retention for demo/lab scenarios.
# -----------------------------------------------------------------------------

resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.project_name}-law"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = var.log_analytics_sku
  retention_in_days = 30
}

resource "azurerm_monitor_diagnostic_setting" "aks" {
  name                       = "${var.project_name}-aks-diag"
  target_resource_id         = var.aks_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_log { category = "kube-apiserver" }
  enabled_log { category = "kube-controller-manager" }
  enabled_log { category = "kube-scheduler" }
  enabled_log { category = "cluster-autoscaler" }
  enabled_log { category = "kube-audit" }
  enabled_log { category = "guard" }

  metric { category = "AllMetrics" }
}

resource "azurerm_monitor_diagnostic_setting" "acr" {
  name                       = "${var.project_name}-acr-diag"
  target_resource_id         = var.acr_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_log { category = "ContainerRegistryLoginEvents" }
  enabled_log { category = "ContainerRegistryRepositoryEvents" }

  metric { category = "AllMetrics" }
}
