####################################
#       Project
####################################
variable "project" {
  type = string
}

variable "environment" {
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

####################################
#       Cloudfront
####################################
variable "cloudfront_404_file" {
  type    = string
  default = "/404.html"
}

variable "default_ttl" {
  type    = number
  default = 3600
}

variable "error_caching_min_ttl" {
  type    = number
  default = 3600
}

variable "min_ttl" {
  type    = number
  default = 0
}

variable "max_ttl" {
  type    = number
  default = 86400
}

####################################
#       Route53
####################################
variable "route53_zone_id" {
  type = string
}

variable "route53_subdomain_prefix" {
  type    = string
  default = ""
}

####################################
#       S3
####################################
variable "enable_bucket_versioning" {
  type    = bool
  default = false
}
