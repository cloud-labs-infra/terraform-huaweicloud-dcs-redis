variable "name" {
  description = "Specifies the instance name"
  type        = string
  nullable    = false
}

variable "name_postfix" {
  description = "Specifies the instance name postfix"
  type        = string
  default     = null
}

variable "description" {
  description = "Specifies the description of an instance"
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the region in which to create the resource, if omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "availability_zones" {
  description = "Specifies the AZ name, if omitted, AZ calculates automatically"
  type        = list(string)
  default     = []
  validation {
    condition     = length(var.availability_zones) <= 1
    error_message = "Redis Single instance needs only one availability zone."
  }
}

variable "engine_version" {
  description = "Specifies the version of a Redis engine"
  type        = string
  default     = "5.0"
  validation {
    condition     = contains(["4.0", "5.0", "6.0"], var.engine_version)
    error_message = "The value can be 4.0, 5.0 or 6.0."
  }
}

variable "capacity" {
  description = "Specifies the cache capacity in GB"
  type        = number
  default     = 0.5
  validation {
    condition     = contains([0.125, 0.25, 0.5, 1, 2, 4, 8, 16, 32, 64], var.capacity)
    error_message = "Valid values are 0.125, 0.25, 0.5, 1, 2, 4, 8, 16, 32, 64."
  }
}

variable "vpc_id" {
  description = "Specifies the VPC ID"
  type        = string
  nullable    = false
}

variable "subnet_id" {
  description = "Specifies the network ID of a subnet"
  type        = string
  nullable    = false
}

variable "port" {
  description = "Specifies the Redis port"
  type        = number
  default     = 6379
}

variable "password" {
  description = <<DES
  Specifies the password of a DCS instance. Changing this creates a new instance.
  The password of a DCS instance must meet the following complexity requirements:

  * Must be a string of 8 to 32 bits in length;
  * Must contain three combinations of the following four characters: Lower case
    letters, uppercase letter, digital, Special characters include (`~!@#$^&*()-_=+\|{}:,<.>/?);
  * The new password cannot be the same as the old password.
  DES
  type        = string
  default     = null
}

variable "whitelist_enable" {
  description = "Enable or disable the IP address whitelists"
  type        = bool
  default     = true
}

variable "whitelist" {
  description = "Specifies the IP addresses which can access the instance"
  type        = map(list(string))
  default     = {}
}

variable "tags" {
  description = "Specifies the key/value pairs to associate with the Redis Instance"
  type        = map(string)
  default     = {}
}
