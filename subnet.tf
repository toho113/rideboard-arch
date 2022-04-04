resource "oci_core_subnet" "service_lb_subnet" {
	cidr_block = var.subnet_1_cidr_block
	compartment_id = var.compartment_ocid
	display_name = "oke-svclbsubnet-rideboard-${random_id.tag.hex}"
	dns_label = "lbsub3d961d49b"
	prohibit_public_ip_on_vnic = "false"
	route_table_id = "${oci_core_default_route_table.generated_oci_core_default_route_table.id}"
	security_list_ids = ["${oci_core_vcn.generated_oci_core_vcn.default_security_list_id}"]
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_subnet" "node_subnet" {
	cidr_block = var.subnet_2_cidr_block
	compartment_id = var.compartment_ocid
	display_name = "oke-nodesubnet-rideboard-${random_id.tag.hex}"
	dns_label = "sub21d14bd50"
	prohibit_public_ip_on_vnic = "true"
	route_table_id = "${oci_core_route_table.generated_oci_core_route_table.id}"
	security_list_ids = ["${oci_core_security_list.node_sec_list.id}"]
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_subnet" "kubernetes_api_endpoint_subnet" {
	cidr_block = var.subnet_3_cidr_block
	compartment_id = var.compartment_ocid
	display_name = "oke-k8sApiEndpoint-subnet-rideboard-${random_id.tag.hex}"
	dns_label = "suba9d3934ba"
	prohibit_public_ip_on_vnic = "false"
	route_table_id = "${oci_core_default_route_table.generated_oci_core_default_route_table.id}"
	security_list_ids = ["${oci_core_security_list.kubernetes_api_endpoint_sec_list.id}"]
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}
