data "huaweicloud_availability_zones" "zones" {
  region = var.region
}

data "huaweicloud_dcs_flavors" "flavors" {
  region         = var.region
  cache_mode     = "single"
  capacity       = var.capacity
  engine         = local.engine
  engine_version = var.engine_version

}

locals {
  availability_zones  = length(var.availability_zones) == 0 ? slice(data.huaweicloud_availability_zones.zones.names, 0, 1) : var.availability_zones
  redis_instance_name = var.name_postfix == null ? format("%s-redis", var.name) : format("%s-redis-%s", var.name, var.name_postfix)
  engine              = "Redis"
}

resource "huaweicloud_dcs_instance" "main" {
  name               = local.redis_instance_name
  region             = var.region
  engine             = local.engine
  engine_version     = var.engine_version
  capacity           = data.huaweicloud_dcs_flavors.flavors.capacity
  flavor             = data.huaweicloud_dcs_flavors.flavors.flavors[0].name
  availability_zones = local.availability_zones
  vpc_id             = var.vpc_id
  subnet_id          = var.subnet_id
  port               = var.port
  password           = var.password
  whitelist_enable   = var.whitelist_enable

  ##
  # security_group_id is not supported for Redis 4.0 and 5.0
  # please configure the whitelists alternatively
  ##
  security_group_id = null

  dynamic "whitelists" {
    for_each = var.whitelist
    content {
      group_name = whitelists.key
      ip_address = whitelists.value
    }
  }

  tags = var.tags
}