output "id" {
  description = "A resource ID in UUID format"
  value       = huaweicloud_dcs_instance.main.id
}

output "status" {
  description = "Cache instance status"
  value       = huaweicloud_dcs_instance.main.status
}

output "domain_name" {
  description = "Domain name of the instance"
  value       = huaweicloud_dcs_instance.main.domain_name
}

output "max_memory" {
  description = "Total memory size in MB"
  value       = huaweicloud_dcs_instance.main.max_memory
}

output "ip_address" {
  description = "IP Address of Redis instance"
  value       = huaweicloud_dcs_instance.main.ip
}

output "port" {
  description = "Port of Redis instance"
  value       = huaweicloud_dcs_instance.main.port
}
