
module "security_vpc" {
  source = "../../modules/vpc"

  name                    = var.security_vpc_name
  cidr_block              = var.security_vpc_cidr
  security_groups         = var.security_vpc_security_groups
  create_internet_gateway = true
  enable_dns_hostnames    = true
  enable_dns_support      = true
  instance_tenancy        = "default"
}


module "security_subnet_sets" {
  source = "../../modules/subnet_set"

  for_each = toset(distinct([for _, v in var.security_vpc_subnets : v.set]))

  name                = each.key
  vpc_id              = module.security_vpc.id
  has_secondary_cidrs = module.security_vpc.has_secondary_cidrs
  cidrs               = { for k, v in var.security_vpc_subnets : k => v if v.set == each.key }
}

/*
module "natgw_set" {
  # This also a "set" and it means the same thing: we will repeat a nat gateway for each subnet (of the subnet_set).
  source = "../../modules/nat_gateway_set"

  subnets = module.security_subnet_sets["natgw"].subnets
}
*/
module "asg" {
    source = "../../modules/asg"

  # Autoscaling group
  asg_name = "${var.asg_name}-${var.name_prefix}"
    ssh_key_name         = var.ssh_key_name
      bootstrap_options    = var.bootstrap_options
        appconnector_version = var.appconnector_version
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
    global_tags                      = var.global_tags

  interfaces = {
    mgmt = {
      device_index       = 0
      security_group_ids = [module.security_vpc.security_group_ids["zpa_app_connector_mgmt"]]
      source_dest_check  = true
      subnet_id          = module.security_subnet_sets["mgmt"].subnets[each.value.az].id
      create_public_ip   = false
    }
  }

#       zpa_provisioning_key = module.zpa_app_connector_group.provisioning_key
#   parameter_name    = "ZSDEMO"
#   path_to_public_key   = var.path_to_public_key
}

module "security_vpc_routes" {
  for_each = { for route in local.security_vpc_routes : "${route.subnet_key}_${route.to_cidr}" => route }
  source   = "../../modules/vpc_route"

  route_table_ids = module.security_subnet_sets[each.value.subnet_key].unique_route_table_ids
  to_cidr         = each.value.to_cidr
  next_hop_set    = each.value.next_hop_set
}