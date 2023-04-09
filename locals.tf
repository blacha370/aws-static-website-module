locals {
  prefix = format("%s-%s", var.project, terraform.workspace)

  create_basic_auth_user     = var.enable_basic_auth && var.basic_auth_user == ""
  create_basic_auth_password = var.enable_basic_auth && var.basic_auth_password == ""

  basic_auth_user     = local.create_basic_auth_user ? random_string.basic_auth_user[0].result : var.basic_auth_user
  basic_auth_password = local.create_basic_auth_password ? nonsensitive(random_password.basic_auth_password[0].result) : var.basic_auth_password
}
