resource "proxmox_vm_qemu" "k8s" {
  name        = var.name
  target_node = "pve-node1" # Can be made dynamic if needed
  clone       = "ubuntu-22.04-template"
  cores       = 2
  memory      = 4096
  os_type     = "cloud-init"
  sshkeys     = file("~/.ssh/id_rsa.pub")

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    type   = "scsi"
    size   = "32G"
    storage = "local-lvm"
  }

  ipconfig0 = "ip=dhcp"
}
