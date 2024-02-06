variable "api_token" {
    type = string
    sensitive = true
}

variable "ssh_username" {
    type = string
}

variable "project" {
    type = string
    default = "test"
}

variable "image" {
    type = string
}

variable "region" {
    type = string
}

variable "size" {
    type = string
}

variable "private_networking" {
    type = bool
    default = false
}

variable "monitoring" {
    type = bool
    default = false
}

variable "tags" {
    type = list(string)
    default = [""]
}

variable "ssh_private_key_file" {
    type = string
    sensitive = true
}

variable "ssh_key_id" {
    type = number
    sensitive = true
}

locals {
    vm_name = "${var.project}-packer-${formatdate("MMM-DD-YYYY", timestamp())}"
}