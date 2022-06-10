# Variables for EC2 Instance
variable "region" {}
variable "name" {}
variable "global_tags" {}
variable "security_vpc_name" {}
variable "security_vpc_cidr" {}
variable "security_vpc_security_groups" {}
variable "security_vpc_subnets" {}
<<<<<<< HEAD
variable "appconnectors" {}
=======
variable "appconnector-vm" {}
>>>>>>> zpa-#4-v0.0.1-single-az-with-natgw
variable "appconnector_version" {}
variable "ssh_key_name" {}
variable "security_vpc_routes_outbound_destin_cidrs" {}
variable "nat_gateway_name" {}
variable "bootstrap_options" {}
variable "iam_instance_profile" {}


# Variables for ZPA App Connector Group
variable "app_connector_group_name" {}
variable "app_connector_group_description" {}
variable "app_connector_group_enabled" {}
variable "app_connector_group_country_code" {}
variable "app_connector_group_latitude" {}
variable "app_connector_group_longitude" {}
variable "app_connector_group_location" {}
variable "app_connector_group_upgrade_day" {}
variable "app_connector_group_upgrade_time_in_secs" {}
variable "app_connector_group_override_version_profile" {}
variable "app_connector_group_version_profile_id" {}
variable "app_connector_group_dns_query_type" {}

<<<<<<< HEAD
=======

>>>>>>> zpa-#4-v0.0.1-single-az-with-natgw
# Variables for ZPA Provisioning Key
variable "provisioning_key_name" {}
variable "provisioning_key_association_type" {}
variable "provisioning_key_max_usage" {}


#aws ssm secure parameter
<<<<<<< HEAD
<<<<<<< HEAD:examples/zpa_single_az_with_natgw/variables.tf
variable "secure_parameters" {}
=======
>>>>>>> zpa-#4-v0.0.1-single-az-with-natgw:examples/zpa_multi_az_with_natgw/variables.tf
=======
variable "secure_parameters" {}
>>>>>>> zpa-#4-v0.0.1-single-az-with-natgw
variable "path_to_public_key" {}
