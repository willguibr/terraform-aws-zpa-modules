# # General
region = "ca-central-1"
name   = "zpa-example"
global_tags = {
  ManagedBy   = "Terraform"
  Application = "Zscaler Private Access"
}


# # Security Groups
security_vpc_security_groups = {
  zpa_app_connector_mgmt = {
    name = "zpa_app_connector_mgmt"
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

# # VPC
security_vpc_name = "security-vpc-example"
security_vpc_cidr = "10.100.0.0/16"

# Security VPC Subnets
security_vpc_subnets = {
  # Do not modify value of `set=`, it is an internal identifier referenced by main.tf.
  "10.100.0.0/24"  = { az = "ca-central-1a", set = "mgmt" }
  "10.100.5.0/24"  = { az = "ca-central-1a", set = "natgw" }
  "10.100.64.0/24" = { az = "ca-central-1b", set = "mgmt" }
  "10.100.69.0/24" = { az = "ca-central-1b", set = "natgw" }
}

### ZPA App Connector VM
appconnector_version = "2021.06"
name_prefix = "zpa"
bootstrap_options    = "user_data.sh"
path_to_public_key = "./local.pub"

### Autoscaling parameters
asg_name = "zpa-autoscaling"
min_size = 1
max_size = 2
desired_capacity = 2