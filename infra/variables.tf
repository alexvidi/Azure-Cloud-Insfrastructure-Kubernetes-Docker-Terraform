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
