// https://www.terraform.io/docs/configuration/variables.html

variable "selected_region" {
  default = "northeurope"
}

variable "resource_group_prefix" {
  default = "slothycode"
  description = "Prefix of the resource group"
}

variable "environments" {
    type = map
    default = {
        "staging"  = "s"
        "live"  = ""
    }
}

variable "domain_prefix" {
    type = map
    default = {
        "staging"  = "s"
        "live"  = ""
    }
}

variable "build" {
  default = "1.0"
}