# -----------------------------------------------------------------------------
# Inputs for registry module
# -----------------------------------------------------------------------------

variable "project_name" {
  description = "Base name used as prefix for ACR."
  type        = string
}

variable "location" {
  description = "Azure region for ACR."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for ACR."
  type        = string
}
