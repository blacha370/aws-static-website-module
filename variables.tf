####################################
#       Project
####################################
variable "project" {
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

variable "cloudfront_domain_name" {
  type = string
}

####################################
#       DNS
####################################
variable "dns_zone" {
  type = string
}

####################################
#       S3
####################################
variable "enable_bucket_versioning" {
  type    = bool
  default = false
}
