# Variables for EC2 Instance
variable "region" {}
variable "name" {}
variable "global_tags" {}
variable "security_vpc_name" {}
variable "security_vpc_cidr" {}
variable "security_vpc_security_groups" {}
variable "security_vpc_subnets" {}
variable "appconnectors" {}
variable "appconnector_version" {}
variable "ssh_key_name" {}
variable "security_vpc_routes_outbound_destin_cidrs" {}
variable "nat_gateway_name" {}
variable "bootstrap_options" {}
variable "iam_instance_profile" {}

variable "app_connector_groups" {
  description = "ZPA App Connector Groups"
  type = list(object({
    app_connector_group_name                     = string
    app_connector_group_description              = string
    app_connector_group_enabled                  = bool
    app_connector_group_country_code             = string
    app_connector_group_dns_query_type           = string
    app_connector_group_latitude                 = string
    app_connector_group_longitude                = string
    app_connector_group_location                 = string
    app_connector_group_lss_app_connector_group  = bool
    app_connector_group_override_version_profile = bool
    app_connector_group_upgrade_day              = string
    app_connector_group_upgrade_time_in_secs     = string
    app_connector_group_version_profile_id       = string
  }))
}


#aws ssm secure parameter
variable "path_to_public_key" {}
