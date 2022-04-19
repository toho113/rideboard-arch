resource "oci_containerengine_cluster" "generated_oci_containerengine_cluster" {
	compartment_id = var.compartment_ocid
	endpoint_config {
		is_public_ip_enabled = "true"
		subnet_id = "${oci_core_subnet.kubernetes_api_endpoint_subnet.id}"
	}
	freeform_tags = {
		"OKEclusterName" = "cluster-rideboard-${random_id.tag.hex}"
	}
	kubernetes_version = "v1.22.5"
	name = "cluster-rideboard-${random_id.tag.hex}"
	options {
		admission_controller_options {
			is_pod_security_policy_enabled = "false"
		}
		persistent_volume_config {
			freeform_tags = {
				"OKEclusterName" = "cluster-rideboard-${random_id.tag.hex}"
			}
		}
		service_lb_config {
			freeform_tags = {
				"OKEclusterName" = "cluster-rideboard-${random_id.tag.hex}"
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
		"OKEnodePoolName" = "pool-rideboard-${random_id.tag.hex}"
	}
	initial_node_labels {
		key = "name"
		value = "cluster-rideboard-${random_id.tag.hex}"
	}
	kubernetes_version = "v1.22.5"
	name = "pool-rideboard-${random_id.tag.hex}"
	node_config_details {
		freeform_tags = {
			"OKEnodePoolName" = "pool-rideboard-${random_id.tag.hex}"
		}
		is_pv_encryption_in_transit_enabled = "true"
		placement_configs {
			availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0]["name"]
			subnet_id = "${oci_core_subnet.node_subnet.id}"
		}
		size = "2"
	}
	node_shape = var.instance_shape
	node_shape_config {
		memory_in_gbs = "6"
		ocpus = "1"
	}
	node_source_details {
		image_id = var.instance_custom_image_ocid
		source_type = "IMAGE"
	}
	ssh_public_key = var.ssh_public_key
}

