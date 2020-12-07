// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.

variable "ogg_dbms" {
  default = "Oracle"
}
variable "ogg_edition" {
  default = "Microservices"
}
variable "ogg_version" {
  default = "19.1.0.0.201013"
}

variable "region" {}
variable "compartment_ocid" {}
variable "availability_domain" { default = "" }

variable "image_compartment_id" {
  default = ""
}

variable "create_new_network" {
  default = false
}

//
//  Network
//
variable "vcn_compartment_id" {
  default = ""
}

variable "vcn_cidr_block" {
  default = "10.2.0.0/16"
}

variable "subnet_compartment_id" {
  default = ""
}

variable "subnet_cidr_block" {
  default = "10.2.1.0/24"
}

//
//  VM
//
variable "assign_public_ip" {
  default = true
}

// Resource display name
variable "display_name" {
  default = "Oracle GoldenGate Microservices Edition for Oracle 19.1.0.0.201013"
}

// DNS names
variable "hostname_label" {
  default = "ogg19cora"
}

variable "vcn_dns_label" {
  default = "vcn"
}

variable "subnet_dns_label" {
  default = "subnet"
}

// Instance shape to create
variable "compute_shape" {
  default = "VM.Standard2.4"
}

// Custom Volume Sizes
variable "custom_volume_sizes" {
  default = false
}

// OGG Boot volume size
variable "boot_size_in_gbs" {
  default = "50"
}

// OGG Swap volume size
variable "swap_size_in_gbs" {
  default = "256"
}

// OGG Trail data volume size
variable "trails_size_in_gbs" {
  default = "512"
}

// OGG Deployment volume size
variable "deployments_size_in_gbs" {
  default = "50"
}

// OGG Cache Manager volume size
variable "cacheManager_size_in_gbs" {
  default = "256"
}

//
// Pre-existing resources
//

// OGG Cache Manager volume
variable "cacheManager_volume_id" {
  default = ""
}

// OGG Deployment volume
variable "deployments_volume_id" {
  default = ""
}

// OGG Trails volume
variable "trails_volume_id" {
  default = ""
}

variable "vcn_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

//
// GoldenGate configuration
//

variable deployments_json {
  default = ""
}

variable deployment_1_name {
  default = ""
}

variable deployment_1_dbms {
  default = ""
}

variable deployment_1_adb {
  default = false
}

variable deployment_1_adb_compartment_id {
  default = ""
}

variable deployment_1_adb_id {
  default = ""
}

variable deployment_2_name {
  default = ""
}

variable deployment_2_dbms {
  default = ""
}

variable deployment_2_adb {
  default = false
}

variable deployment_2_adb_compartment_id {
  default = ""
}

variable deployment_2_adb_id {
  default = ""
}

// Public SSH key for 'opc' user
variable "ssh_public_key" {
  default = ""
}
