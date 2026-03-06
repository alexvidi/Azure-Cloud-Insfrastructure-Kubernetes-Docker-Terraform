# -----------------------------------------------------------------------------
# Inputs for monitoring module
# -----------------------------------------------------------------------------

variable "project_name" {
  description = "Base name used as prefix for monitoring resources."
  type        = string
}

variable "location" {
  description = "Azure region for monitoring resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for monitoring resources."
  type        = string
}

variable "log_analytics_sku" {
  description = "SKU for the Log Analytics workspace."
  type        = string
}

variable "aks_id" {
  description = "AKS cluster resource ID for diagnostics."
  type        = string
}

variable "acr_id" {
  description = "ACR resource ID for diagnostics."
  type        = string
}
