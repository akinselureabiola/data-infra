module "airflow_production" {
    source            = "../modules/s3/"
    
    bucket_name       = "airflow-production-logss"
    team              = var.team
    environment       = var.environment
}