module "airflow_glue_database" {
  source = "../modules/glue_database"

  glue_db_name = "airflow-staging"
  team         = var.team
  environment  = var.environment 
  description = "Glue database for airflow staging environment"
}

module "airbyte_glue_db" {
    source = "../modules/glue_database"

    glue_db_name = "airbyte-staging"
    team = var.team
    environment = var.environment
    description = "Glue database for airbyte staging environment" 
}
