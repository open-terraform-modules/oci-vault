resource "oci_kms_key" "main" {
  #Required
  compartment_id = var.compartment_id
  display_name   = var.display_name

  key_shape {
    #Required
    algorithm = var.key_shape_algorithm
    length    = var.key_shape_length
  }

  management_endpoint = var.management_endpoint

  #Optional
  defined_tags    = var.defined_tags
  freeform_tags   = var.freeform_tags
  protection_mode = var.key_protection_mode

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}