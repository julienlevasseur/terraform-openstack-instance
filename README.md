# README

Provide a basic configuration to describe an OpenStack instance with Terraform.

## Usage

```bash
export TF_VAR_os_network='foo'
```

```
variable "os_network" {}
variable "instance_name" {
  default = "foo"
}

variable "instance_image_name" {
  default = "foo"
}

variable "instance_flavor_name" {
  default = "foo"
}

variable "instance_key_pair" {
  default = "foo"
}

module "openstack_instance" {
  source = "julienlevasseur/instance/openstack"
  name              = "${var.instance_name}"
  image_name        = "${var.instance_image_name}"
  flavor_name       = "${var.instance_flavor_name}"
  key_pair          = "${var.instance_key_pair}"
  security_groups   = "${list(module.openstack_secgroup_ssh.sg_name)}"
  network           = "${var.os_network}"
}
```

## Authors

Julien Levasseur (https://github.com/julienlevasseur)