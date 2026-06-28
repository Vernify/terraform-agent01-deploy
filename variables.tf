variable "proxmox_api_url" {
  description = "Proxmox API URL (e.g., https://pve08.vernify.com:8006/api2/json)."
  type        = string
  default     = "https://pve08.vernify.com:8006/api2/json"
}

variable "proxmox_user" {
  description = "Proxmox user (username@realm)."
  type        = string
  default     = "root@pam"
}

variable "proxmox_password" {
  description = "Proxmox password."
  type        = string
  sensitive   = true
}

variable "proxmox_node" {
  description = "Proxmox node to create the LXC container on."
  type        = string
  default     = "pve08"
}

variable "network_bridge" {
  description = "Bridge for the LXC container's primary NIC."
  type        = string
  default     = "vmbr0"
}

variable "lxc_hostname" {
  description = "Hostname for the LXC container."
  type        = string
  default     = "agent01"
}

variable "lxc_vmid" {
  description = "LXC container ID. Auto-assigned by Proxmox if null."
  type        = number
  default     = null
}

variable "lxc_storage" {
  description = "Storage for LXC container (e.g. 'pve-08-zfs' or 'local-lvm')."
  type        = string
  default     = "pve-08-zfs"
}

variable "lxc_cores" {
  description = "vCPU cores for agent01 LXC (build executor workload — lighter than VM)."
  type        = number
  default     = 2
}

variable "lxc_memory" {
  description = "Memory (MiB) for agent01 LXC (lighter than VM)."
  type        = number
  default     = 4096
}

variable "lxc_swap" {
  description = "Swap (MiB) for agent01 LXC."
  type        = number
  default     = 512
}

variable "lxc_disk_size" {
  description = "Root disk size (GiB) for agent01 LXC."
  type        = number
  default     = 20
}

variable "lxc_osimage" {
  description = "LXC OS image to clone (must exist on Proxmox node). Format: 'storage:vztmpl/template-name.tar.zst'."
  type        = string
  default     = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}

variable "ssh_public_keys" {
  description = "SSH public keys authorised for the root user (LXC containers run as root). REQUIRED for Ansible access. Public keys are not secret."
  type        = list(string)
  default     = []
}

variable "ipv4_address" {
  description = "LXC container IPv4 address in CIDR notation (e.g., '192.168.22.53/24')."
  type        = string
  default     = "192.168.22.53/24"
}

variable "ipv4_gateway" {
  description = "Gateway for static IPv4 configuration."
  type        = string
  default     = "192.168.22.1"
}

variable "tags" {
  description = "Tags to apply to the LXC container in Proxmox."
  type        = list(string)
  default     = ["vernify", "ci", "agent"]
}

variable "search_domain" {
  description = "DNS search domain applied to the LXC container."
  type        = string
  default     = "vernify.com"
}
