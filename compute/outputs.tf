// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.

output "image_id" {
  value = "${oci_core_instance.vm.source_details.0.source_id}"
}

output "instance_id" {
  value = "${oci_core_instance.vm.id}"
}

output "public_ip" {
  value = "${var.assign_public_ip ? join("", oci_core_public_ip.public_ip.*.ip_address) : "[]"}"
}
