# Example values for the OCI Vault module

# Compartment OCID where the vault will be created
compartment_id = "ocid1.compartment.oc1..exampleuniqueID"

# Name of the vault
display_name = "example-vault"

# Vault type: 'DEFAULT' or 'VIRTUAL_PRIVATE'
vault_type = "DEFAULT"

# Freeform tags for the vault
freeform_tags = {
  Environment = "Dev"
  Project     = "OpenTerraformModules"
}

# Defined tags for the vault
defined_tags = {
  "Operations.CostCenter" = "12345"
}