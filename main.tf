data "google_project" "project" {}

resource "google_service_account" "account" {
  account_id   = var.name
  display_name = var.display

  # creation of service accounts is eventually consistent
  provisioner "local-exec" {
    command  = "sleep 60"
  }
}

resource "google_project_iam_member" "roles" {
  # workaround for https://github.com/hashicorp/terraform/issues/22281
  for_each = { for v in var.roles : v => v }
  
  role     = each.value
  member   = "serviceAccount:${google_service_account.account.email}"
}

resource "google_service_account_key" "account_key" {
  service_account_id = google_service_account.account.email
}

resource "vault_generic_secret" "secret_key" {
  path = var.key
  data_json = "{\"key\": \"${base64decode(google_service_account_key.account_key.private_key)}\"}"
  count = var.key ? 1 : 0
}

resource "vault_gcp_secret_roleset" "secret_token" {
  backend      = "gcp"
  roleset      = var.token
  secret_type  = "access_token"
  project      = google_project.project.project_id
  token_scopes = ["https://www.googleapis.com/auth/devstorage.read_only"]

  binding {
    resource = "//cloudresourcemanager.googleapis.com/projects/${google_project.project.project_id}"
    roles = var.roles
  }

  count = var.token ? 1 : 0
}

data "google_service_account_access_token" "account_token" {
  target_service_account = google_service_account.account.email
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only"]
  lifetime = "300s"
}
