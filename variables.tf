####################################
#       Project
####################################
variable "project" {
  type = string
}

####################################
#       DNS
####################################
variable "dns_zone" {
  type = string
}

variable "cloudfront_domain_name" {
  type = string
}

####################################
#       Basic auth
####################################
variable "enable_basic_auth" {
  type    = bool
  default = false
}

variable "basic_auth_user" {
  type    = string
  default = ""
}

variable "basic_auth_password" {
  type    = string
  default = ""
}
