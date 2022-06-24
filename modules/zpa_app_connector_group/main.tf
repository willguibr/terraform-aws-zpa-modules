# Either use a pre-existing resource or create a new one. So, is it a pre-existing App Connector Group or Provisioning Key then?
locals {
  app_connector_group = var.create_app_connector_group ? zpa_app_connector_group.this[0] : data.zpa_app_connector_group.this[0]
  provisioning_key = var.create_provisioning_key ? zpa_provisioning_key.this[0] : data.zpa_provisioning_key.this[0]
}

data "zpa_enrollment_cert" "connector" {
    name = "Connector"
}

data "zpa_provisioning_key" "this" {
  count = var.create_provisioning_key == false ? 1 : 0
  name  = var.name
  association_type = var.association_type
}

data "zpa_app_connector_group" "this" {
  count = var.create_app_connector_group == false ? 1 : 0
  name  = var.name
}

# Create a new App Connector Group.
resource "zpa_app_connector_group" "this" {
  count = var.create_app_connector_group ? 1 : 0

  name                     = var.name
  description              = var.description
  enabled                  = var.enabled
  country_code             = var.country_code
  dns_query_type           = var.dns_query_type
  latitude                 = var.latitude
  longitude                = var.longitude
  location                 = var.location
  lss_app_connector_group  = var.lss_app_connector_group
  override_version_profile = var.override_version_profile
  upgrade_day              = var.upgrade_day
  upgrade_time_in_secs     = var.upgrade_time_in_secs
  version_profile_id       = var.version_profile_id
}


resource "zpa_provisioning_key" "this" {
  count = var.create_provisioning_key ? 1 : 0

    name                     = var.name
    enabled                  = var.enabled
    association_type         = var.association_type
    enrollment_cert_id       = data.zpa_enrollment_cert.connector.id
    max_usage                = var.max_usage
    zcomponent_id            = zpa_app_connector_group.this[0].id
}
