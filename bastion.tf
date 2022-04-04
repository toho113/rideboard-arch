resource "oci_bastion_bastion" "rideb_bastion" {
    #Required
    bastion_type = var.bastion_bastion_type
    compartment_id = var.compartment_ocid
    target_subnet_id = oci_core_subnet.node_subnet.id  #Private subnet for WEB
    client_cidr_block_allow_list = var.bastion_client_cidr_block_allow_list
    name = var.bastion_name
}
