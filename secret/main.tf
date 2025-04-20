resource "tls_private_key" "ssh" {
  count     = var.type == "ssh" ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "oci_vault_secret" "main" {
  #Required
  compartment_id = var.compartment_id

  secret_content {
    #Required
    content_type = var.content_type

    #Optional
    content = var.type == "ssh" ? base64encode(tls_private_key.ssh[0].private_key_pem) : var.secret_content
    name    = var.content_name
  }

  secret_name = var.secret_name
  vault_id    = var.vault_id

  #Optional
  defined_tags  = var.defined_tags
  description   = var.description
  freeform_tags = var.freeform_tags
  key_id        = var.encryption_key_id

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}