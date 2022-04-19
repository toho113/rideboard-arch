resource "oci_core_security_list" "service_lb_sec_list" {
	compartment_id = var.compartment_ocid
	display_name = "oke-svclbseclist-rideboard-${random_id.tag.hex}"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}


resource "oci_core_security_list" "node_sec_list" {
	compartment_id = var.compartment_ocid
	display_name = "oke-nodeseclist-rideboard-${random_id.tag.hex}"
	egress_security_rules {
		description = "Allow pods on one worker node to communicate with pods on other worker nodes"
		destination = var.subnet_2_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "all"
		stateless = "false"
	}
	egress_security_rules {
		description = "Access to Kubernetes API Endpoint"
		destination = var.subnet_3_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "Kubernetes worker to control plane communication"
		destination = var.subnet_3_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "Path discovery"
		destination = var.subnet_3_cidr_block
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	egress_security_rules {
		description = "Allow nodes to communicate with OKE to ensure correct start-up and continued functioning"
		destination = lookup(data.oci_core_services.AllOCIServices[0].services[0], "cidr_block")
		destination_type = "SERVICE_CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "ICMP Access from Kubernetes Control Plane"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	egress_security_rules {
		description = "Worker Nodes access to Internet"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		protocol = "all"
		stateless = "false"
	}
	ingress_security_rules {
		description = "Allow pods on one worker node to communicate with pods on other worker nodes"
		protocol = "all"
		source = var.subnet_2_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Path discovery"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		source = var.subnet_3_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "TCP access from Kubernetes Control Plane"
		protocol = "6"
		source = var.subnet_3_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Inbound SSH traffic to worker nodes"
		protocol = "6"
		source = "0.0.0.0/0"
		stateless = "false"
	}
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_security_list" "kubernetes_api_endpoint_sec_list" {
	compartment_id = var.compartment_ocid
	display_name = "oke-k8sApiEndpoint-rideboard-${random_id.tag.hex}"
	egress_security_rules {
		description = "Allow Kubernetes Control Plane to communicate with OKE"
		destination = lookup(data.oci_core_services.AllOCIServices[0].services[0], "cidr_block")
		destination_type = "SERVICE_CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "All traffic to worker nodes"
		destination = var.subnet_2_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "Path discovery"
		destination = var.subnet_2_cidr_block
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	ingress_security_rules {
		description = "External access to Kubernetes API endpoint"
		protocol = "6"
		source = "0.0.0.0/0"
		stateless = "false"
	}
	ingress_security_rules {
		description = "Kubernetes worker to Kubernetes API endpoint communication"
		protocol = "6"
		source = var.subnet_2_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Kubernetes worker to control plane communication"
		protocol = "6"
		source = var.subnet_2_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Path discovery"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		source = var.subnet_2_cidr_block
		stateless = "false"
	}
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}
