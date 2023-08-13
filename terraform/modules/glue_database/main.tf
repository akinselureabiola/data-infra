resource "aws_glue_catalog_database" "airflow_glue_database" {
  name = var.glue_db_name
  tags = {
    Team        = var.team
    Environment = var.environment
  }
}
