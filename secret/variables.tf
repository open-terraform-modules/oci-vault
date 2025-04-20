variable "compartment_id" {
  description = "(Required) (Updatable) Compartment id where to create all resources"
  type        = string
}

variable "vault_id" {
  description = "The OCID of the vault where you want to create the secret."
  type        = string
  default     = null
}

variable "encryption_key_id" {
  description = "The OCID of the master encryption key that is used to encrypt the secret."
  type        = string
  default     = null
}

variable "secret_name" {
  description = "(Required) A user-friendly name for the secret. Secret names should be unique within a vault. Avoid entering confidential information. Valid characters are uppercase or lowercase letters, numbers, hyphens, underscores, and periods."
  type        = string
}

variable "description" {
  description = "(Optional) (Updatable) A brief description of the secret. Avoid entering confidential information."
  type        = string
  default     = null
}

variable "content_type" {
  description = "(Updatable) content type."
  type        = string
  default     = "BASE64"
}

variable "secret_content" {
  description = "(Optional) (Updatable) The base64-encoded content of the secret."
  type        = string
  sensitive   = true
  default     = null
}

variable "content_name" {
  description = "(Updatable) Names should be unique within a secret. Valid characters are uppercase or lowercase letters, numbers, hyphens, underscores, and periods."
  type        = string
  default     = "1"
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace."
  type        = map(any)
  default     = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(any)
  default     = null
}

variable "type" {
  description = "(Optional) (Updatable) If ssh key then generates key pair and secrets. "
  type        = string
  default     = null
}