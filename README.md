# Google Service Account IAM Key

A Terraform module that will create a Google Cloud Platform Service Account with the specified IAM roles applied. The module will also export a service account key and token.

## Usage

```hcl
provider "google" {
  version = "~> 2.12"
  project = var.project
}

module "deploy" {
  source  = "gendall/service-account-iam-key/google"
  roles   = [
    "roles/dialogflow.admin"
  ]
}
```

## Deployment

This role will be automatically built and deployed to [Terraform Registry](https://registry.terraform.io/modules/gendall) when a [Semver](https://semver.org) tag is pushed to the repo.
