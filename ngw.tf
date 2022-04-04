resource "oci_core_nat_gateway" "generated_oci_core_nat_gateway" {
	compartment_id = var.compartment_ocid
	display_name = "oke-ngw-quick-oke-rideboard-customcluster-d5e1f23d4"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}
