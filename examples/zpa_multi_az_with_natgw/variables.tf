variable "name-prefix" {
  description = "The name prefix for all your resources"
  default     = "zsdemo"
  type        = string
}
variable "resource-tag" {
  description = "A tag to associate to all the App Connector module resources"
  default     = "zsdemo"
}

### General
variable "region" {}
variable "global_tags" {}
variable "security_vpc_name" {}
variable "security_vpc_cidr" {}
variable "security_vpc_security_groups" {}
# variable "gwlb_name" {}
variable "security_vpc_routes_outbound_source_cidrs" {}
variable "security_vpc_routes_outbound_destin_cidrs" {}
# variable "gwlb_endpoint_set_outbound_name" {}
variable "security_vpc_subnets" {}
variable "create_ssh_key" {}
variable "ssh_key_name" {}
variable "nat_gateway_name" {}
variable "appconnectors" {}
variable "bootstrap_options" {}
variable "appconnector_version" {}
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

# Variables for ZPA Provisioning Key
variable "provisioning_key_name" {}
variable "provisioning_key_association_type" {}
variable "provisioning_key_max_usage" {}


#aws ssm secure parameter
variable "secure_parameters" {}
variable "path_to_public_key" {}