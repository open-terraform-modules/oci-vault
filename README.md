# OCI Vault Terraform Module

This repository contains Terraform modules for managing Oracle Cloud Infrastructure (OCI) Vaults, Keys, and Secrets. These modules allow you to create and manage vaults, keys, and secrets with customizable configurations.

---

## Usage

```hcl
module "vault" {
    source          = "path/to/oci-vault"
    compartment_id  = "ocid1.compartment.oc1..exampleuniqueID"
    display_name    = "example-vault"
    vault_type      = "DEFAULT"
    freeform_tags   = { Environment = "Dev" }
    defined_tags    = { Department = "Finance" }
}

module "key" {
    source               = "path/to/oci-vault/key"
    compartment_id       = "ocid1.compartment.oc1..exampleuniqueID"
    management_endpoint  = module.vault.management_endpoint
    key_shape_algorithm  = "AES"
    key_shape_length     = "32"
    key_protection_mode  = "HSM"
    freeform_tags        = { Environment = "Dev" }
    defined_tags         = { Department = "Finance" }
}

module "secret" {
    source          = "path/to/oci-vault/secret"
    compartment_id  = "ocid1.compartment.oc1..exampleuniqueID"
    vault_id        = module.vault.id
    secret_name     = "example-secret"
    description     = "This is an example secret"
    content_type    = "BASE64"
    secret_name     = base64encode("example-secret-content")
    freeform_tags   = { Environment = "Dev" }
    defined_tags    = { Department = "Finance" }
}
```

---

## Modules

### Vault

The `oci-vault` module creates an OCI Vault.

#### Resources

- `oci_kms_vault`: Creates a vault in the specified compartment.

#### Inputs

| Name              | Description                                                                 | Type         | Default   | Required |
|-------------------|-----------------------------------------------------------------------------|--------------|-----------|----------|
| `compartment_id`  | (Required) Compartment ID where the vault will be created.                 | `string`     |           | Yes      |
| `display_name`    | (Required) A user-friendly name for the vault.                             | `string`     |           | Yes      |
| `vault_type`      | (Required) The type of vault to create (`DEFAULT` or `VIRTUAL_PRIVATE`).   | `string`     | `DEFAULT` | No       |
| `freeform_tags`   | (Optional) Free-form tags for the vault.                                   | `map(string)`| `null`    | No       |
| `defined_tags`    | (Optional) Defined tags for the vault.                                     | `map(string)`| `null`    | No       |

#### Outputs

| Name                  | Description                       |
|-----------------------|-----------------------------------|
| `id`                  | The OCID of the created vault.   |
| `management_endpoint` | The management endpoint of the vault. |

---

### Key

The `oci-vault/key` module creates an encryption key within a vault.

#### Resources

- `oci_kms_key`: Creates a key in the specified vault.

#### Inputs

| Name                  | Description                                                                 | Type         | Default   | Required |
|-----------------------|-----------------------------------------------------------------------------|--------------|-----------|----------|
| `compartment_id`      | (Required) Compartment ID where the key will be created.                   | `string`     |           | Yes      |
| `display_name`        | (Required) A user-friendly name for the key.                               | `string`     |           | Yes      |
| `management_endpoint` | (Required) The management endpoint of the vault.                          | `string`     |           | Yes      |
| `key_shape_algorithm` | (Optional) The algorithm used by the key (`AES`, `RSA`, etc.).             | `string`     | `AES`     | No       |
| `key_shape_length`    | (Optional) The length of the key in bytes.                                | `string`     | `32`      | No       |
| `key_protection_mode` | (Optional) The protection mode of the key (`HSM` or `SOFTWARE`).          | `string`     | `HSM`     | No       |
| `freeform_tags`       | (Optional) Free-form tags for the key.                                    | `map(string)`| `null`    | No       |
| `defined_tags`        | (Optional) Defined tags for the key.                                      | `map(string)`| `null`    | No       |

#### Outputs

| Name  | Description                  |
|-------|------------------------------|
| `id`  | The OCID of the created key. |

---

### Secret

The `oci-vault/secret` module creates a secret within a vault.

#### Resources

- `oci_vault_secret`: Creates a secret in the specified vault.

#### Inputs

| Name              | Description                                                                 | Type         | Default   | Required |
|-------------------|-----------------------------------------------------------------------------|--------------|-----------|----------|
| `compartment_id`  | (Required) Compartment ID where the secret will be created.                | `string`     |           | Yes      |
| `vault_id`        | (Required) The OCID of the vault where the secret will be stored.          | `string`     |           | Yes      |
| `secret_name`     | (Required) A user-friendly name for the secret.                            | `string`     |           | Yes      |
| `description`     | (Optional) A brief description of the secret.                              | `string`     | `null`    | No       |
| `content_type`    | (Optional) The content type of the secret (`BASE64`, etc.).                | `string`     | `BASE64`  | No       |
| `secret_content`  | (Optional) The base64-encoded content of the secret.                       | `string`     | `null`    | No       |
| `content_name`    | (Optional) A unique name for the secret content.                           | `string`     | `1`       | No       |
| `freeform_tags`   | (Optional) Free-form tags for the secret.                                  | `map(string)`| `null`    | No       |
| `defined_tags`    | (Optional) Defined tags for the secret.                                    | `map(string)`| `null`    | No       |
| `type`            | (Optional) If `ssh`, generates an SSH key pair and stores it as a secret.  | `string`     | `null`    | No       |

#### Outputs

| Name  | Description                  |
|-------|------------------------------|
| `id`  | The OCID of the created secret. |

---

## Contributing

To contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

## Author

This module is maintained by [Andres Montealegre](mailto:montealegre.af@gmail.com).