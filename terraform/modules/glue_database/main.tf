resource "aws_glue_catalog_database" "airflow_glue_database" {
  name = var.glue_db_name
  description = var.description
}

