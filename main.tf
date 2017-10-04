resource "openstack_compute_instance_v2" "instance" {
  name              = "${var.name}"
  image_name        = "${var.image_name}"
  flavor_name       = "${var.flavor_name}"
  key_pair          = "${var.key_pair}"
  security_groups   = ["${var.security_groups}"]
  network {
    name = "${var.network}"
  }
}

output "name" {
  value = "${openstack_compute_instance_v2.instance.name}"
}

output "access_ip_v4" {
  value = "${openstack_compute_instance_v2.instance.access_ip_v4}"
}

# Note :
#   security_groups is embeded in brackets to avoid this error :
#     * module.openstack_instance.openstack_compute_instance_v2.instance:
#        security_groups: should be a list
#
#   To append elements to this list use :
#     security_groups   = "${list(module.openstack_secgroup_ssh.foo)}"
#   or :
#     security_groups   = "${concat(module.openstack_secgroup_ssh.foo, module.openstack_secgroup_ssh.bar)}"
#
