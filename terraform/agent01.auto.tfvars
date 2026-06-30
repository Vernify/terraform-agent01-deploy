# Vernify agent01 configuration (LXC container for Jenkins agent + Vault agent + toolchain)

lxc_hostname  = "agent01"
proxmox_node  = "pve08"
lxc_cores     = 2
lxc_memory    = 4096
lxc_swap      = 512
lxc_disk_size = 20
lxc_storage   = "pve-08-zfs"
network_bridge = "vmbr0"
lxc_osimage   = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"

# SSH access
ssh_public_keys = [
  "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHBONYUsAucJJGHF+ZCX/ikkvdxdm6beeqKGK/ctw1+1JqApjaAcYspGWehW7vmqkyeM+GuUm5qgi7+hHqDKAjE= wernervandermerwe@Werners-Laptop.local"
]

# Static IP for agent01 LXC container
ipv4_address = "192.168.22.53/24"
ipv4_gateway = "192.168.22.1"

# Container tags for Proxmox organization
tags = ["vernify", "ci", "agent"]
