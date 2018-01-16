provider "openstack" {
  tenant_name = "${var.provider_block["tenant_name"]}"
  user_name   = "${var.provider_block["user_name"]}"
  password    = "${var.provider_block["password"]}"
  auth_url    = "${var.provider_block["auth_url"]}"
}

resource "openstack_compute_instance_v2" "basicErnest" {
  name            = "${var.instance_block["name"]}"
  image_id        = "${var.instance_block["image_id"]}"
  flavor_id       = "${var.instance_block["flavor_id"]}"
  key_pair        = "${var.instance_block["key_pair"]}"
  security_groups = ["${var.instance_block["security_groups_1"]}", "${var.instance_block["security_groups_2"]}"]

  network {
    name = "${var.network_name}"
  }

}

resource "openstack_networking_secgroup_v2" "secgroup_1_Ernest" {
  name        = "${var.secgroup_block["name"]}"
  description = "${var.secgroup_block["description"]}"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_v4Ernest" {
  direction = "${var.secgroup_rule_block["direction"]}"
  ethertype = "${var.secgroup_rule_block["ethertype"]}"
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_1_Ernest.id}"
}

resource "openstack_blockstorage_volume_v2" "volume_1Ernest" {
  name = "${var.volume_name}"
  size = "${var.volume_size}"
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.basicErnest.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.volume_1Ernest.id}"
}
