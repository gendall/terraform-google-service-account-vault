output "key" {
  value = base64decode(google_service_account_key.account_key.private_key)
}

output "token" {
  value = data.google_service_account_access_token.account_token.access_token
}
