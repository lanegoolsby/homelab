provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure = true
}

module "network" {
  source = "./proxmox/network"
}

module "k8s-master" {
  source = "./proxmox"
  for_each = toset(var.k8s_master_names)
  name     = each.key
  vm_type  = "master"
}

module "k8s-worker" {
  source = "./proxmox"
  for_each = toset(var.k8s_worker_names)
  name     = each.key
  vm_type  = "worker"
}
