# -----------------------------------------------------------------------------
# Inputs for network module
# -----------------------------------------------------------------------------

variable "project_name" {
  description = "Base name used as prefix for network resources."
  type        = string
}

variable "location" {
  description = "Azure region for the network."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where network resources are created."
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network."
  type        = string
}

variable "aks_subnet_prefix" {
  description = "Subnet prefix dedicated to AKS nodes."
  type        = string
}
