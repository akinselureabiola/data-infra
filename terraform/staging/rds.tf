resource "random_password" "password" {
  length           = 16
  special          = false
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/rds/password"
  type  = "String"
  value = random_password.password.result
}

module "postgres_db" {
    source = "../modules/rds/"

    db_name                 = "main"
    identifier              = "postgres"
    allocated_storage       = "20"
    engine                   = "postgres"
    engine_version           = "14"
    instance_class           = "db.t3.micro"
    username                 = "staging_db"
    password                 = aws_ssm_parameter.db_password.value
    skip_final_snapshot      = var.skip_final_snapshot
    port                     = "5432"
}
