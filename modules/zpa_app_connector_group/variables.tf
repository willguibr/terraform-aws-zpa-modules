
variable "create_app_connector_group" { default = true }
variable "name" { default = null }
variable "description" { default = null }
variable "enabled" { default = true }
variable "country_code" { default = null }
variable "dns_query_type" { default = null }
variable "location" { default = null }
variable "lss_app_connector_group" { default = true }
variable "override_version_profile" { default = true }
variable "upgrade_day" { default = null }
variable "upgrade_time_in_secs" { default = null }
variable "version_profile_id" { default = null }

variable "latitude" {
  description = "Latitude of the App Connector Group. Value in the range of -90 to 90"
  type        = string
  default     = ""
  validation {
    condition     = length(var.latitude) >= -90 && length(var.latitude) <= 90
    error_message = "Latitude must be between -90 and 90, inclusive."
  }
}

variable "longitude" {
  description = "Longitude of the App Connector Group. Value in the range of -180 to 180"
  type        = string
  default     = ""
  validation {
    condition     = length(var.longitude) >= -180 && length(var.longitude) <= 180
    error_message = "Longitude must be between -180 and 180, inclusive."
  }
}


variable "create_provisioning_key" { default = true }
variable "use_provisioning_key" { default = false }
# variable "name" { default = null }
# variable "enabled" { default = true }
variable "association_type" { default = null }
variable "max_usage" { default = null }
variable "zcomponent_id" { default = null }
