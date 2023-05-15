# Huawei Cloud DCS Redis Single node
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.47 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_dcs_instance.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dcs_instance) | resource |
| [huaweicloud_availability_zones.zones](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/availability_zones) | data source |
| [huaweicloud_dcs_flavors.flavors](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/dcs_flavors) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Specifies the AZ name, if omitted, AZ calculates automatically | `list(string)` | `[]` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the cache capacity in GB | `number` | `0.5` | no |
| <a name="input_description"></a> [description](#input\_description) | Specifies the description of an instance | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Specifies the version of a Redis engine | `string` | `"5.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the instance name | `string` | n/a | yes |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | Specifies the instance name postfix | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | Specifies the password of a DCS instance. Changing this creates a new instance.<br>  The password of a DCS instance must meet the following complexity requirements:<br><br>  * Must be a string of 8 to 32 bits in length;<br>  * Must contain three combinations of the following four characters: Lower case<br>    letters, uppercase letter, digital, Special characters include (`~!@#$^&*()-_=+\|{}:,<.>/?);<br>  * The new password cannot be the same as the old password.<br>` | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | Specifies the Redis port | `number` | `6379` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the resource, if omitted, the provider-level region will be used | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Specifies the network ID of a subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies the key/value pairs to associate with the Redis Instance | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Specifies the VPC ID | `string` | n/a | yes |
| <a name="input_whitelist"></a> [whitelist](#input\_whitelist) | Specifies the IP addresses which can access the instance | `map(list(string))` | `{}` | no |
| <a name="input_whitelist_enable"></a> [whitelist\_enable](#input\_whitelist\_enable) | Enable or disable the IP address whitelists | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | Domain name of the instance |
| <a name="output_id"></a> [id](#output\_id) | A resource ID in UUID format |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | IP Address of Redis instance |
| <a name="output_max_memory"></a> [max\_memory](#output\_max\_memory) | Total memory size in MB |
| <a name="output_port"></a> [port](#output\_port) | Port of Redis instance |
| <a name="output_status"></a> [status](#output\_status) | Cache instance status |
<!-- END_TF_DOCS -->