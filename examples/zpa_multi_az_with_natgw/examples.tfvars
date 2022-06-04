# General
region = "ca-central-1"
global_tags = {
  ManagedBy   = "Terraform"
  Application = "Zscaler Private Access"
}

## VPC
security_vpc_name = "security-vpc-example"
security_vpc_cidr = "10.100.0.0/16"

# # Security Groups
security_vpc_security_groups = {
  appconnector_data = {
    name = "appconnector_data"
    rules = {
      all_outbound = {
        description = "Permit All traffic outbound"
        type        = "egress", from_port = "0", to_port = "0", protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
      ssh = {
        description = "Allow SSH to App Connector VM"
        type        = "ingress", from_port = "22", to_port = "22", protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # TODO: update here
      }
    }
  }
}

# Security VPC Subnets
security_vpc_subnets = {
  # Do not modify value of `set=`, it is an internal identifier referenced by main.tf.
  # "10.100.0.0/24"  = { az = "us-east-1a", set = "mgmt" }
  # "10.100.64.0/24" = { az = "us-east-1b", set = "mgmt" }
  "10.100.1.0/24"  = { az = "ca-central-1a", set = "data" }
  "10.100.65.0/24" = { az = "ca-central-1b", set = "data" }
  # "10.100.2.0/24"  = { az = "us-east-1a", set = "untrust" }
  # "10.100.66.0/24" = { az = "us-east-1b", set = "untrust" }
  # "10.100.3.0/24"  = { az = "us-east-1a", set = "gwlbe_outbound" }
  # "10.100.67.0/24" = { az = "us-east-1b", set = "gwlbe_outbound" }
  # "10.100.4.0/24"  = { az = "us-east-1a", set = "gwlb" }
  # "10.100.68.0/24" = { az = "us-east-1b", set = "gwlb" }
  "10.100.5.0/24"  = { az = "ca-central-1a", set = "natgw" }
  "10.100.69.0/24" = { az = "ca-central-1b", set = "natgw" }
}

# Gateway Load Balancer
# gwlb_name                       = "example-security-gwlb"
# gwlb_endpoint_set_outbound_name = "outbound-gwlb-endpoint"

### NAT gateway
nat_gateway_name = "example-natgw"

# ZPA App Connector
appconnector_version = "2021.06"
create_ssh_key   = false
ssh_key_name     = "ssh"
appconnectors = {
  appconnectorvm01 = { az = "ca-central-1a" }
  appconnectorvm02 = { az = "ca-central-1b" }
}

secure_parameters  = "ZSDEMO"
iam_instance_profile = "zsdemo-instance-profile"
path_to_public_key = "./local.pub"
bootstrap_options = "./user_data.sh"

# Security VPC routes ###
security_vpc_routes_outbound_source_cidrs = [ # outbound traffic return after inspection
  "10.0.0.0/8",
]

security_vpc_routes_outbound_destin_cidrs = [ # outbound traffic incoming for inspection from TGW
  "0.0.0.0/0",
]

## ZPA App Connector Group
  app_connector_group_name                     = "zsdemo-app-connector-aws"
  app_connector_group_description              = "zsdemo-app-connector-aws"
  app_connector_group_enabled                  = true
  app_connector_group_country_code             = "US"
  app_connector_group_latitude                 = "37.3382082"
  app_connector_group_longitude                = "-121.8863286"
  app_connector_group_location                 = "San Jose, CA, USA"
  app_connector_group_upgrade_day              = "SUNDAY"
  app_connector_group_upgrade_time_in_secs     = "66600"
  app_connector_group_override_version_profile = true
  app_connector_group_version_profile_id       = "2"
  app_connector_group_dns_query_type           = "IPV4_IPV6"

  ## ZPA App Connector Provisioning Key
  provisioning_key_name             = "zsdemo-app-connector-aws"
  provisioning_key_association_type = "CONNECTOR_GRP"
  provisioning_key_max_usage        = 50