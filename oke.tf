resource "oci_containerengine_cluster" "generated_oci_containerengine_cluster" {
	compartment_id = var.compartment_ocid
	endpoint_config {
		is_public_ip_enabled = "true"
		subnet_id = "${oci_core_subnet.kubernetes_api_endpoint_subnet.id}"
	}
	freeform_tags = {
		"OKEclusterName" = "oke-rideboard-customcluster"
	}
	kubernetes_version = "v1.22.5"
	name = "oke-rideboard-customcluster"
	options {
		admission_controller_options {
			is_pod_security_policy_enabled = "false"
		}
		persistent_volume_config {
			freeform_tags = {
				"OKEclusterName" = "oke-rideboard-customcluster"
			}
		}
		service_lb_config {
			freeform_tags = {
				"OKEclusterName" = "oke-rideboard-customcluster"
			}
		}
		service_lb_subnet_ids = ["${oci_core_subnet.service_lb_subnet.id}"]
	}
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_containerengine_node_pool" "create_node_pool_details0" {
	cluster_id = "${oci_containerengine_cluster.generated_oci_containerengine_cluster.id}"
	compartment_id = var.compartment_ocid
	freeform_tags = {
		"OKEnodePoolName" = "pool1"
	}
	initial_node_labels {
		key = "name"
		value = "oke-rideboard-customcluster"
	}
	kubernetes_version = "v1.22.5"
	name = "pool-rideboard-${random_id.tag.hex}"
	node_config_details {
		freeform_tags = {
			"OKEnodePoolName" = "pool1"
		}
		is_pv_encryption_in_transit_enabled = "true"
		placement_configs {
			availability_domain = "MCUQ:CA-TORONTO-1-AD-1"
			subnet_id = "${oci_core_subnet.node_subnet.id}"
		}
		size = "3"
	}
	node_shape = "VM.Standard.E3.Flex"
	node_shape_config {
		memory_in_gbs = "16"
		ocpus = "1"
	}
	node_source_details {
		image_id = "ocid1.image.oc1.ca-toronto-1.aaaaaaaadhxm5f6xnahswbfcnsvfsxesf7fyfmyyba3blmynb2rw2dq54phq"
		source_type = "IMAGE"
	}
	ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKThH0Llnr9TtW7sNlm6PuigaKo3A/jWcuijCYxcYeJSZMKnlzm3AUIDUV3iw1u4OkiUGRwLTo2SMNZtnauK/H/rxxz5uq4pDopdAbM7XWmBT+gc0JsDuigj7bzcAAk0pa7GVlnNabika/6M8ETJjgv3yasxCugxfMKFj7LAZxWS2ymnsFmB5y/XubVjrXW4EZuWQcNI+S1QS39XqRkdgWUcsvGq+NGVVe4FjzS/Fx5eKPp+g5UZ7JUrdMAqYQtLAFgdH/OhQHbO1PFqFoI3eKE8NlJdShPLTMuGfrOHrqL1GldneAJrsCO9NGJ2qdfEMfgXgc87Vc9qu6RsFUOBvV rsa-key-20220220"
}

