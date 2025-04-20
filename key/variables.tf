variable "compartment_id" {
  description = "(Required) (Updatable) Compartment id where to create all resources"
  type        = string
}

variable "display_name" {
  description = "(Required) A user-friendly name for the key. Avoid entering confidential information. Valid characters are uppercase or lowercase letters, numbers, hyphens, underscores, and periods."
  type        = string
}

variable "management_endpoint" {
  description = "(Required) The service endpoint to perform management operations against. Management operations include 'Create,' 'Update,' 'List,' 'Get,' and 'Delete' operations. See Vault Management endpoint."
  type        = string
  default     = null
}

variable "key_shape_algorithm" {
  description = "The algorithm used by a key's key versions to encrypt or decrypt."
  type        = string
  default     = "AES"
}

variable "key_shape_length" {
  description = "The length of the key in bytes, expressed as an integer."
  type        = string
  default     = "32"
}

variable "key_protection_mode" {
  description = "Required) The service endpoint to perform management operations against. Management operations include 'Create,' 'Update,' 'List,' 'Get,' and 'Delete' operations. See Vault Management endpoint."
  type        = string
  default     = "HSM"
}