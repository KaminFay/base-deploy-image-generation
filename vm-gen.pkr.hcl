packer {
    required_plugins {
        digitalocean = {
            version = ">= 1.0.4"
            source = "github.com/digitalocean/digitalocean"
        }
    }

}

source "digitalocean" "template" {
    api_token = var.api_token
    image = var.image
    region = var.region
    size = var.size
    // SSH information has to be for a new key, not one already associated with your DO account
    ssh_username = var.ssh_username
    private_networking = var.private_networking
    snapshot_name = local.vm_name
    monitoring = var.monitoring
    tags = var.tags
}

build {
    sources = ["source.digitalocean.template"]

    // For if we need to put files on the image
    // provisioner "file" {
        // source = "./scripts"
        // destination = "/scripts"
    // }

    // Run our bootstrapping process
    provisioner "shell" {
        script = "scripts/bootstrap.sh"
    }

    // Just a quick proof that we are in fact provisioning with packer and we finished
    provisioner "shell" {
        inline = ["touch /root/provisioned-by-packer"]
    }
}
