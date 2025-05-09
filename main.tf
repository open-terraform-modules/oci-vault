resource "oci_kms_vault" "main" {
  #Required
  compartment_id = var.compartment_id
  display_name   = var.display_name
  vault_type     = var.vault_type

  #Optional
  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}