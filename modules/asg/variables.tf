variable "appconnector_version" {
  description = "ZPA App Connector version to deploy."
  default     = "2021.06"
}

# variable "fw_license_type" {
#   description = "Select License type (byol/payg1/payg2)."
#   default     = "byol"
# }

variable "zpa_product_code" {
  description = <<-EOF
  Product code corresponding to a chosen App Connector license type model - by default - BYOL.
  Please refer to the: [ZPA App Connector documentation](https://help.zscaler.com/zpa/connector-deployment-guide-amazon-web-services)
  EOF
  default = {
    "byol"  = "3n2udvk6ba2lglockhnetlujo"
    # "payg1" = "6kxdw3bbmdeda3o6i1ggqt4km"
    # "payg2" = "806j2of0qy5osgjjixq9gqc6g"
  }
  type = map(string)
}

variable instance_type {
  description = "App Connector Instance Type"
  default     = "t3.medium"
  validation {
          condition     = (
            var.instance_type == "t3.medium" ||
            var.instance_type == "t2.medium" ||
            var.instance_type == "m5.large"  ||
            var.instance_type == "c5.large"  ||
            var.instance_type == "c5a.large"
          )
          error_message = "Input instance_type must be set to an approved vm instance type."
      }
}

variable "name_prefix" {
  description = "All resource names will be prepended with this string."
  type        = string
}

variable "asg_name" {
  description = "Name of the autoscaling group to create."
  default     = "asg1"
  type        = string
}

variable "ssh_key_name" {
  description = "Name of AWS keypair to associate with instances."
  type        = string
}

variable "bootstrap_options" {
  description = "Bootstrap options to put into userdata."
  default     = {}
  type        = map(any)
}

variable "interfaces" {
  type = list(any)
}

variable "subnet_ids" {
  description = "Map of subnet ids"
  type        = map(any)
}

variable "security_group_ids" {
  description = "Map of security group ids"
  type        = map(any)
}

variable "lifecycle_hook_timeout" {
  description = "How long should we wait in seconds for the Lambda hook to finish."
  type        = number
  default     = 300
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "warm_pool_state" {
  description = "See the [provider's documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group#warm_pool). Ignored when `max_group_prepared_capacity` is 0 (the default value)."
  default     = null
}

variable "warm_pool_min_size" {
  description = "See the [provider's documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group#warm_pool). Ignored when `max_group_prepared_capacity` is 0 (the default value)."
  default     = null
}

variable "max_group_prepared_capacity" {
  description = "Set to non-zero to activate the Warm Pool of instances. See the [provider's documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group#warm_pool)."
  default     = 0
}

variable "global_tags" {
  type = map(any)
}