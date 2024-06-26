module "airflow_log" {
    source            = "../modules/s3/"
    
    bucket_name       = "airflow-staging-logs"
    team              = var.team
    environment       = var.environment
}

module "airflow_extraction" {
    source              = "../modules/s3/"
    bucket_name         = "data-staging-airflow-extraction"
    team                = var.team
    environment         = var.environment
}

module "airbyte_extraction" {
    source               = "../modules/s3/"
    bucket_name          = "data-production-airbyte-extraction"
    team                 = var.team
    environment          = var.environment
}

module "faker_data_extraction" {
    source               = "../modules/s3/"
    bucket_name          = "faker-dataset"
    team                 = var.team
    environment          = var.environment
}
