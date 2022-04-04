resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_block = var.vcn_cidr_block
	compartment_id = var.compartment_ocid
	display_name = "oke-vcn-quick-oke-rideboard-customcluster-d5e1f23d4"
	dns_label = "okerideboardcus"
}
