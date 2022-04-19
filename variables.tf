## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Variables
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "ATP_password" {}

variable "availability_domain_name" {}

/*
variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.4.2"
}

*/

variable "vcn_cidr_block" {
  default = "10.87.0.0/16"
}

variable "subnet_1_cidr_block" {
  default = "10.87.10.0/24"
}

variable "subnet_2_cidr_block" {
  default = "10.87.20.0/24"
}

variable "subnet_3_cidr_block" {
  default = "10.87.30.0/24"
}

variable "oracle_instant_client_version" {
  #  default     = "21.1"
  default = "19.10"
}

variable "oracle_instant_client_version_short" {
  #  default     = "21"
  default = "19.10"
}

# OS Images
variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "instance_shape" {
  default = "VM.Standard.A1.Flex"
}

variable "instance_flex_shape_ocpus" {
  default = 1
}

variable "instance_flex_shape_memory" {
  default = 6
}

variable "instance_custom_image_ocid" {
  default = "ocid1.image.oc1.us-sanjose-1.aaaaaaaavdvrps3ull3geohu3ce4n35dgzur5mbqcep5gdymjtqvdqusngda"
}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKThH0Llnr9TtW7sNlm6PuigaKo3A/jWcuijCYxcYeJSZMKnlzm3AUIDUV3iw1u4OkiUGRwLTo2SMNZtnauK/H/rxxz5uq4pDopdAbM7XWmBT+gc0JsDuigj7bzcAAk0pa7GVlnNabika/6M8ETJjgv3yasxCugxfMKFj7LAZxWS2ymnsFmB5y/XubVjrXW4EZuWQcNI+S1QS39XqRkdgWUcsvGq+NGVVe4FjzS/Fx5eKPp+g5UZ7JUrdMAqYQtLAFgdH/OhQHbO1PFqFoI3eKE8NlJdShPLTMuGfrOHrqL1GldneAJrsCO9NGJ2qdfEMfgXgc87Vc9qu6RsFUOBvV rsa-key-20220220"
}

variable "lb_shape" {
  default = "flexible"
}

variable "flex_lb_min_shape" {
  default = "10"
}

variable "flex_lb_max_shape" {
  default = "10"
}

variable "ATP_private_endpoint" {
  default = true
}

variable "ATP_free_tier" {
  default = false
}

variable "ATP_database_cpu_core_count" {
  default = 1
}

variable "ATP_database_data_storage_size_in_tbs" {
  default = 1
}

variable "ATP_database_db_name" {
  default = "ATPAS"
}

variable "ATP_database_db_version" {
  default = "19c"
}

variable "ATP_database_defined_tags_value" {
  default = "value"
}

variable "ATP_database_display_name" {
  default = "ATPAS"
}

variable "ATP_database_freeform_tags" {
  default = {
    "Owner" = "ATP"
  }
}

variable "ATP_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "ATP_tde_wallet_zip_file" {
  default = "tde_wallet_aTFdb.zip"
}

variable "ATP_private_endpoint_label" {
  default = "ATPASPrivateEndpoint"
}

variable "ATP_data_guard_enabled" {
  default = false
}

variable "bastion_name" {
  default = "ridebbastion"
}

variable "bastion_bastion_type" {
  default = "standard"
}

variable "bastion_client_cidr_block_allow_list" {
  default = ["0.0.0.0/0"]
}



# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex",
    "VM.Standard.A1.Flex",
    "VM.Optimized3.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_node_shape = contains(local.compute_flexible_shapes, var.instance_shape)
}

