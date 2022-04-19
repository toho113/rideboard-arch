resource "oci_core_nat_gateway" "generated_oci_core_nat_gateway" {
	compartment_id = var.compartment_ocid
	display_name = "oke-ngw-rideboard-${random_id.tag.hex}"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}
