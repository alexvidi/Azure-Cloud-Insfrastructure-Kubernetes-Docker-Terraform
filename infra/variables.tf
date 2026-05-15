# -----------------------------------------------------------------------------
# Input variables for the Terraform project
# -----------------------------------------------------------------------------

# Base name used as prefix for all Azure resources.
variable "project_name" {
  description = "Base name used as prefix for all Azure resources."
  type        = string
  default     = "alexdevops99"
}

# Azure region where the resources will be created.
variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "East US"
}

# -----------------------------------------------------------------------------
# Networking
# -----------------------------------------------------------------------------

# Virtual network address space.
variable "address_space" {
  description = "Address space for the VNet."
  type        = string
  default     = "10.10.0.0/16"
}

# AKS subnet range.
variable "aks_subnet_prefix" {
  description = "Subnet prefix dedicated to AKS nodes."
  type        = string
  default     = "10.10.1.0/24"
}

# Optional restriction for API server public endpoint.
variable "authorized_ip_ranges" {
  description = "List of authorized IP CIDRs for AKS API server access."
  type        = list(string)
  default     = []
}

# AKS node configuration.
variable "node_count" {
  description = "Number of nodes in the default AKS node pool."
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "VM size for the AKS node pool."
  type        = string
  default     = "Standard_B2s"
}

variable "admin_group_object_ids" {
  description = "Azure AD group Object IDs granted AKS admin access."
  type        = list(string)
  default     = []
}

variable "github_sp_object_id" {
  description = "Object ID of the GitHub Actions Service Principal. Grants AKS cluster-admin via Azure RBAC."
  type        = string
}

# -----------------------------------------------------------------------------
# Observability
# -----------------------------------------------------------------------------
variable "log_analytics_sku" {
  description = "SKU for the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}
