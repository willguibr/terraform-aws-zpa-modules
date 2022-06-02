module "test" {
  for_each = var.name
  source = "../../modules/zpa_app_connector_group"

  name                     = var.name
  description              = var.description
  enabled                  = var.enabled
  country_code             = var.country_code
  latitude                 = var.latitude
  longitude                = var.longitude
  location                 = var.location
  upgrade_day              = var.upgrade_day
  upgrade_time_in_secs     = var.upgrade_time_in_secs
  override_version_profile = var.override_version_profile
  version_profile_id       = var.version_profile_id
  dns_query_type           = var.dns_query_type
}
