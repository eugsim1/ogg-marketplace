# Identity and access parameters

variable "private_key_path" {
  description = "The path to oci api private key."
  type        = string
}



variable "tenancy_ocid" {
  description = "The tenancy id in which to create the sources."
  type        = string
}

variable "user_ocid" {
  description = "The id of the user that terraform will use to create the resources."
  type        = string
}


variable "fingerprint" {}