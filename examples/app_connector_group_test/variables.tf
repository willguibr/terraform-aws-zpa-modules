// Create Zscaler App Connector Group
variable "name" {
  default = "Canada Connector Group"
  type    = string
}

variable "description" {
  default = "Canada Connector Group"
  type    = string
}

variable "enabled" {
  default = true
  type    = bool
}

# variable "city_country" {
#   default = "Langley, CA"
#   type    = string
# }

variable "country_code" {
  default = "CA"
  type    = string
}

variable "latitude" {
  default = "49.1041779"
  type    = string
}

variable "longitude" {
  default = "-122.6603519"
  type    = string
}

variable "location" {
  default = "Langley City, BC, Canada"
  type    = string
}

variable "upgrade_day" {
  default = "SUNDAY"
  type    = string
}

variable "upgrade_time_in_secs" {
  default = "66600"
  type    = string
}

variable "override_version_profile" {
  default = true
  type    = bool
}

variable "version_profile_id" {
  default = 0
  type    = string
}

variable "dns_query_type" {
  default = "IPV4"
  type    = string
}