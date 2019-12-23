variable "name" {
  type = string
  default = "deploy"
  description = "The account name to use for the Google Service Account."
}

variable "display" {
  type = string
  default = "Automated deploy account"
  description = "The human-readable name shown in the Google Cloud Platform console."
}

variable "roles" {
 type = list
 default = []
 description = "A list of the Google Cloud Platform IAM roles that should be added."
}
