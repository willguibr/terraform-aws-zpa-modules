<<<<<<< HEAD
# output "public_ips" {
#   description = "Map of public IPs created within the module."
#   value       = { for k, v in module.vmseries : k => v.public_ips }
# }
=======
/*
output "public_ips" {
  description = "Map of public IPs created within the module."
  value       = { for k, v in module.app_connector : k => v.public_ips }
}
*/
>>>>>>> zpa-#4-v0.0.1-single-az-with-natgw
