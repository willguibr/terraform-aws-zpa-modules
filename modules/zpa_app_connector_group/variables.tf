variable "app_connector_group_name" { default = null }
variable "app_connector_group_description" { default = null }
variable "app_connector_group_enabled" { default = true }
variable "app_connector_group_country_code" { default = null }
variable "app_connector_group_latitude" { default = null}
variable "app_connector_group_longitude" { default = null }
variable "app_connector_group_location" { default = null }
variable "app_connector_group_upgrade_day" { default = null }
variable "app_connector_group_upgrade_time_in_secs" { default = null }
variable "app_connector_group_override_version_profile" { default = true }
variable "app_connector_group_version_profile_id" { default = null  }
variable "app_connector_group_dns_query_type" { default = null }


variable "provisioning_key_name" { default = null }
variable "provisioning_key_enabled" { default = true }
variable "provisioning_key_association_type" { default = null  }
variable "provisioning_key_max_usage" { default = null }