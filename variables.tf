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
