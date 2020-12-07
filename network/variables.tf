// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.

variable "vcn_compartment_id" {}
variable "subnet_compartment_id" {}
variable "display_name" {}
variable "vcn_cidr_block" {}
variable "subnet_cidr_block" {}
variable "assign_public_ip" {}

variable "vcn_dns_label" {}
variable "subnet_dns_label" {}

// Use existing network
variable "create_new_network" {}

variable "vcn_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}
