terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.1"
    }
   azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }

  }
}



provider "libvirt" {
  uri   = "qemu+ssh://root@nas3/system"
}
