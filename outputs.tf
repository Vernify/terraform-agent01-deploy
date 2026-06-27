output "agent01_vm_id" {
  description = "Proxmox VM ID for agent01."
  value       = module.agent01.vm_id
}

output "agent01_ipv4_address" {
  description = "IPv4 address assigned to agent01."
  value       = module.agent01.ipv4_address
}
