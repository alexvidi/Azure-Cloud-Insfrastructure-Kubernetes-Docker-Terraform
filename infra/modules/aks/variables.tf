# -----------------------------------------------------------------------------
# Inputs for AKS module
# -----------------------------------------------------------------------------

variable "project_name" {
  description = "Base name used as prefix for AKS."
  type        = string
}

variable "location" {
  description = "Azure region for AKS."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for AKS."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the AKS node pool (Azure CNI)."
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool."
  type        = number
}

variable "node_vm_size" {
  description = "VM size for nodes in the default pool."
  type        = string
}

variable "authorized_ip_ranges" {
  description = "Authorized IP ranges for the API server."
  type        = list(string)
}

variable "admin_group_object_ids" {
  description = "AAD group object IDs with admin access (optional)."
  type        = list(string)
}
