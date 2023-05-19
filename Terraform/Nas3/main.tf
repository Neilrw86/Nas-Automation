terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}


provider "libvirt" {
  ## Configuration options
  #uri = "qemu:///system"
  alias = "nas3"
  uri   = "qemu+ssh://root@nas3/system"
}
