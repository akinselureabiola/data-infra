module "airflow_log_bucket" {
    source            = "../modules/s3"
    
    bucket_name       = "airflow-staging-logs"
    team              = var.team
    environment       = var.environment
}
