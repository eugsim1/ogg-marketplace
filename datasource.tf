data "oci_identity_availability_domains" "availability_domains" {
  #Required
  compartment_id = var.tenancy_ocid
}

output "availability_domains_name" {
  value = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name
}