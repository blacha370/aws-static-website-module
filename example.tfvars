####################################
#       Project
####################################
project = "example"

####################################
#       Basic auth
####################################
enable_basic_auth   = true
basic_auth_user     = "user"     # leave blank for random value
basic_auth_password = "password" # leave blank for random value

####################################
#       Cloudfront
####################################
cloudfront_404_file    = "/404.html"
cloudfront_domain_name = "example.org"

####################################
#       DNS
####################################
dns_zone = "example.org"

####################################
#       S3
####################################
enable_bucket_versioning = false
