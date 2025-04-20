# Example values for OCI Vault keys

# Compartment OCID where the vault and keys will be created
compartment_id = "ocid1.compartment.oc1..exampleuniqueID"

# Vault OCID where the key will be created
vault_id = "ocid1.vault.oc1..exampleuniqueID"

# Name of the key
display_name = "example-key"

# Key shape algorithm (e.g., AES, RSA)
key_shape_algorithm = "AES"

# Key shape length (e.g., 256 for AES, 2048 for RSA)
key_shape_length = 256

# Freeform tags for the key
freeform_tags = {
  environment = "dev"
  project     = "example-project"
}

# Defined tags for the key
defined_tags = {
  "Operations" = {
    "CostCenter" = "12345"
  }
}