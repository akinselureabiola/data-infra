module "airflow_glue_database" {
  source = "../modules/glue_database"

  glue_db_name = "airflow-staging"
  team         = var.team
  environment  = var.environment 
}
