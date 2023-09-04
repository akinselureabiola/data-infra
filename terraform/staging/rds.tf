resource "random_password" "password" {
  length           = 16
  special          = false
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/rds/password"
  type  = "String"
  overwrite = true
  value = random_password.password.result
}
