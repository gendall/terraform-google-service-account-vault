# Google Service Account Vault

A Terraform module that will create a Google Cloud Platform Service Account with the specified IAM roles applied. The module will also:

* export a service account key and store it at the specified [Vault](https://www.vaultproject.io/) path
* create a [Vault GCP Roleset](https://www.vaultproject.io/docs/secrets/gcp/index.html) that can be used to fetch a service account token at the specified [Vault](https://www.vaultproject.io/) path

## Usage

```hcl
provider "google" {
  version = "~> 2.12"
  project = var.project
}

provider "vault" {}

module "storage" {
  source  = "gendall/service-account-vault/google"
  key = "secrets/data/my-project/google"
  token = "gcp/token/my-project"
  roles   = [
    "roles/object.admin"
  ]
}
```

## Deployment

This role will be automatically built and deployed to [Terraform Registry](https://registry.terraform.io/modules/gendall) when a [Semver](https://semver.org) tag is pushed to the repo.
