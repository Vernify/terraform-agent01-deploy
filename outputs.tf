output "agent01_container_id" {
  description = "Proxmox LXC container ID for agent01."
  value       = proxmox_lxc.agent01.vmid
}

output "agent01_hostname" {
  description = "Hostname of the agent01 LXC container."
  value       = proxmox_lxc.agent01.hostname
}

output "agent01_ipv4_address" {
  description = "IPv4 address assigned to agent01 LXC container."
  value       = split("/", var.ipv4_address)[0]
}
