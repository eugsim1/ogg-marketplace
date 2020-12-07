// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.

output "subnet_id" {
  value = "${var.create_new_network ? join("", oci_core_subnet.subnet.*.id) : var.subnet_id}"
}
