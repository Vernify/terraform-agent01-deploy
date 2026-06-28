# Vernify — agent01 build capacity host (LXC container).
#
# Provisions the agent01 Ubuntu 24.04 LXC container for Jenkins agent + Vault agent + toolchain.
# LXC is lighter than VMs; runs systemd for agent/vault services.
# Runs IN the `agent01` TFC workspace (created by terraform-workspaces-deploy).

terraform {
  required_version = ">= 1.15.6"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }

  # Cloud backend commented out for local testing; uncomment when running in TFC.
  # cloud {
  #   organization = "Vernify"
  #   workspaces {
  #     name = "agent01"
  #   }
  # }
}

provider "proxmox" {
  # Telmate/proxmox provider — using username/password auth
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = true
}

resource "proxmox_lxc" "agent01" {
  hostname = var.lxc_hostname
  vmid     = var.lxc_vmid
  node     = var.proxmox_node
  ostype   = "ubuntu"
  osversion = "24.04"
  storage  = var.lxc_storage

  # Container specifications
  cores   = var.lxc_cores
  memory  = var.lxc_memory
  swap    = var.lxc_swap

  # Root filesystem
  rootfs {
    storage = var.lxc_storage
    size    = "${var.lxc_disk_size}G"
  }

  # Clone from existing container template on Proxmox
  osimage = var.lxc_osimage

  # Network configuration
  network {
    name   = "eth0"
    bridge = var.network_bridge
    ip     = var.ipv4_address
    gw     = var.ipv4_gateway
  }

  # DNS configuration
  nameserver = "192.168.22.1"
  searchdomain = var.search_domain

  # Enable systemd (required for Jenkins agent + Vault agent services)
  init = 1

  # SSH access via cloud-init or local SSH config
  # Keys are provisioned via /etc/ssh/authorized_keys or cloud-init equivalent
  ssh_public_keys = join("\n", var.ssh_public_keys)

  # Container setup
  unprivileged = 1
  start        = true
  onboot       = true

  # Tags for organization
  tags = join(";", var.tags)
}
