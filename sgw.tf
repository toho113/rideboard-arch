resource "oci_core_service_gateway" "generated_oci_core_service_gateway" {
	compartment_id = var.compartment_ocid
	display_name = "oke-sgw-rideboard-${random_id.tag.hex}"
	services {
		service_id = lookup(data.oci_core_services.AllOCIServices[0].services[0], "id")
	}
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}
