// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.

#######locals {
#######ad = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name
#######
#######}

module "swap_block_volume" {
  source              = "./block_volume"
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name ###"${var.availability_domain}"
  size_in_gbs         = "${var.swap_size_in_gbs}"
  display_name        = "${var.display_name} (Swap)"
}

module "trails_block_volume" {
  source              = "./block_volume"
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name ###"${var.availability_domain}"
  size_in_gbs         = "${var.trails_size_in_gbs}"
  display_name        = "${var.display_name} (Trails)"
  existing_volume_id  = "${var.trails_volume_id}"
}

module "deployments_block_volume" {
  source              = "./block_volume"
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name ###"${var.availability_domain}"
  size_in_gbs         = "${var.deployments_size_in_gbs}"
  display_name        = "${var.display_name} (Deployments)"
  existing_volume_id  = "${var.deployments_volume_id}"
}

module "cacheManager_block_volume" {
  source              = "./block_volume"
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name ###"${var.availability_domain}"
  size_in_gbs         = "${var.cacheManager_size_in_gbs}"
  display_name        = "${var.display_name} (Cache Manager)"
  existing_volume_id  = "${var.cacheManager_volume_id}"
}

module "ogg_image" {
  source            = "./image"
  compartment_id    = "${var.image_compartment_id}"
  market_image_id   = "${local.mp_listing_resource_id}"
  custom_image_name = "ogg-${var.ogg_version}-${var.ogg_edition}-${var.ogg_dbms}"
}

module "ogg_network" {
  source                = "./network"
  vcn_compartment_id    = "${var.vcn_compartment_id != "" ? var.vcn_compartment_id : var.compartment_ocid}"
  subnet_compartment_id = "${var.subnet_compartment_id != "" ? var.subnet_compartment_id : var.compartment_ocid}"
  display_name          = "${var.display_name}"
  vcn_cidr_block        = "${var.vcn_cidr_block}"
  subnet_cidr_block     = "${var.subnet_cidr_block}"
  assign_public_ip      = "${var.assign_public_ip}"
  create_new_network    = "${var.create_new_network}"
  vcn_id                = "${var.vcn_id}"
  vcn_dns_label         = "${var.vcn_dns_label}"
  subnet_id             = "${var.subnet_id}"
  subnet_dns_label      = "${var.subnet_dns_label}"
}

module "adb_wallet_1" {
  source                 = "./wallet"
  fetch_wallet           = "${var.deployment_1_adb}"
  autonomous_database_id = "${var.deployment_1_adb_id}"
}

module "adb_wallet_2" {
  source                 = "./wallet"
  fetch_wallet           = "${var.deployment_2_adb}"
  autonomous_database_id = "${var.deployment_2_adb_id}"
}

module "ogg_compute" {
  depends_on = [module.ogg_network]
  source     = "./compute"
  deployments = "${var.deployments_json != "" ? var.deployments_json
    : var.deployment_2_name != "" && var.deployment_2_dbms != "" ? "[ {\"name\":\"${var.deployment_1_name}\",\"dbms\":\"${var.deployment_1_dbms}\"}, {\"name\":\"${var.deployment_2_name}\",\"dbms\":\"${var.deployment_2_dbms}\"} ]"
  : "[ {\"name\":\"${var.deployment_1_name}\",\"dbms\":\"${var.deployment_1_dbms}\"} ]"}"
  deployment_1_wallet    = "${module.adb_wallet_1.wallet}"
  deployment_2_wallet    = "${module.adb_wallet_2.wallet}"
  compartment_id         = "${var.compartment_ocid}"
  availability_domain    = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name ###"${var.availability_domain}"
  ssh_public_key         = "${var.ssh_public_key}"
  boot_size_in_gbs       = "${var.boot_size_in_gbs}"
  display_name           = "${var.display_name}"
  hostname_label         = "${var.hostname_label}"
  compute_shape          = "${var.compute_shape}"
  image_id               = "${module.ogg_image.image_id}"
  swap_volume_id         = "${module.swap_block_volume.volume_id}"
  trails_volume_id       = "${var.trails_volume_id != "" ? var.trails_volume_id : module.trails_block_volume.volume_id}"
  deployments_volume_id  = "${var.deployments_volume_id != "" ? var.deployments_volume_id : module.deployments_block_volume.volume_id}"
  cacheManager_volume_id = "${var.cacheManager_volume_id != "" ? var.cacheManager_volume_id : module.cacheManager_block_volume.volume_id}"
  subnet_id              = "${module.ogg_network.subnet_id}"
  assign_public_ip       = "${var.assign_public_ip}"
}
