resource "oci_core_service_gateway" "generated_oci_core_service_gateway" {
	compartment_id = var.compartment_ocid
	display_name = "oke-sgw-rideboard-${random_id.tag.hex}"
	services {
		service_id = "ocid1.service.oc1.ca-toronto-1.aaaaaaaaxwhdaheitj3qvugait3k4cqnqt6d76dlhxl3nv3dof6abuu4xhga"
	}
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}
