// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.

locals {
  mp_listing_id               = "ocid1.appcataloglisting.oc1..aaaaaaaapvdqgl3dgkhmxdcdcxfa7jrmeq5vni6dmv3zhhmqwsnj2qwdy6fa"
  mp_listing_resource_id      = "ocid1.image.oc1..aaaaaaaao6vzfanmsm6cegxxtpfymdgupwsc7dezmf6v5ms7tjxucsoj2eua"
  mp_listing_resource_version = "Oracle_GoldenGate_Microservices_Edition_19.1.0.0.201013_v1.0"

  vcn_compartment_id    = var.compartment_ocid
  subnet_compartment_id = var.compartment_ocid
}
