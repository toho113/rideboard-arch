## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Create regional subnets in vcn

resource "oci_core_subnet" "subnet_1" {
  cidr_block      = "10.0.0.0/24"
  display_name    = "subnet-pub-LB"
  compartment_id  = var.compartment_ocid
  vcn_id          = oci_core_virtual_network.vcn.id
  dhcp_options_id = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id  = oci_core_route_table.rt-pub.id
  dns_label       = "subnet1"

  provisioner "local-exec" {
    command = "sleep 5"
  }
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

resource "oci_core_subnet" "subnet_2" {
  cidr_block      = "10.0.1.0/24"
  display_name    = "subnet-priv-WEBVM"
  compartment_id  = var.compartment_ocid
  vcn_id          = oci_core_virtual_network.vcn.id
  dhcp_options_id = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id  = oci_core_route_table.rt-priv.id
  dns_label       = "subnet2"
  prohibit_public_ip_on_vnic = true
  provisioner "local-exec" {
    command = "sleep 5"
  }
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

resource "oci_core_subnet" "subnet_3" {
  cidr_block                 = "10.0.2.0/24"
  display_name               = "subnet-priv-DB"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_virtual_network.vcn.id
  dhcp_options_id            = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id             = oci_core_route_table.rt-priv.id
  prohibit_public_ip_on_vnic = true
  dns_label                  = "subnet3"

  provisioner "local-exec" {
    command = "sleep 5"
  }
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

