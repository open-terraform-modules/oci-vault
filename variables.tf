variable "compartment_id" {
  description = "(Required) (Updatable) Compartment id where to create all resources"
  type        = string
}

variable "display_name" {
  description = "(Required) (Updatable) A user-friendly name for the vault. It does not have to be unique, and it is changeable. Avoid entering confidential information."
  type        = string
}

variable "vault_type" {
  description = "(Required) The type of vault to create. Each type of vault stores the key with different degrees of isolation and has different options and pricing."
  type        = string
  default     = "DEFAULT"
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace."
  type        = map(string)
  default     = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(string)
  default     = null
}