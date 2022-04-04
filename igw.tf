resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
	compartment_id = var.compartment_ocid
	display_name = "oke-igw-rideboard-${random_id.tag.hex}"
	enabled = "true"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

