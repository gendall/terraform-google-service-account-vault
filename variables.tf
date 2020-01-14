variable "name" {
  type = string
  default = "service"
  description = "The account name to use for the Google Service Account."
}

variable "display" {
  type = string
  default = "Automated service account"
  description = "The human-readable name shown in the Google Cloud Platform console."
}

variable "key" {
  type = string
  default = ""
  description = "A Hashicorp Vault path at which to store the Service Account Key"
}

variable "token" {
  type = string
  default = ""
  description = "A Hashicorp Vault path at which to create a Google Cloud Secrets roleset to fetch a Service Account Token"
}

variable "roles" {
 type = list
 default = []
 description = "A list of the Google Cloud Platform IAM roles that should be added."
}
