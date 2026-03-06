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

# -----------------------------------------------------------------------------
# Observability
# -----------------------------------------------------------------------------
variable "log_analytics_sku" {
  description = "SKU for the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}
