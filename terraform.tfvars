provider_block = {
  tenant_name = "student"
  user_name = "student"
  password = "mySuperSecret"
  auth_url = "http://holly.ownrobot.ru:5000/v2.0"
}

instance_block = {
  name = "basicErnest"
  image_id = "5ad7a233-8f2b-4711-9e8d-65317b048cd9"
  flavor_id = "2"
  key_pair = "devops"
  security_groups_1 = "default"
  security_groups_2 = "secgroup_1_Ernest"
}

network_name = "flat-provider-network"

secgroup_block = {
  name = "secgroup_1_Ernest"
  description = "My neutron security group"
}

secgroup_rule_block = {
  direction = "ingress"
  ethertype = "IPv4"
}

volume_name = "volume_1Ernest"

volume_size = 1
