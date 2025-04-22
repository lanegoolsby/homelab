variable "proxmox_api_url" {}
variable "proxmox_api_token_id" {}
variable "proxmox_api_token_secret" {}
variable "k8s_master_names" {
  type    = list(string)
  default = ["k8s-master-1"]
}
variable "k8s_worker_names" {
  type    = list(string)
  default = ["k8s-worker-1", "k8s-worker-2"]
}

# terraform/outputs.tf
output "master_ips" {
  value = module.k8s-master[*].ip
}

output "worker_ips" {
  value = module.k8s-worker[*].ip
}
