resource "aws_iam_user" "airflow_user" {
  name = "airflow"
}


resource "aws_iam_access_key" "airflow_credentials" {
  user = aws_iam_user.airflow_user.name
}

resource "aws_ssm_parameter" "airflow_access_key" {
  name  = "/airflow/access_key"
  type  = "String"
  value =  aws_iam_access_key.airflow_credentials.id
}

resource "aws_ssm_parameter" "airflow_secret_key" {
  name  = "/airflow/secret_key"
  type  = "String"
  value =  aws_iam_access_key.airflow_credentials.secret
}


data "aws_iam_policy_document" "airflow_policy_document" {
  statement {
    effect = "Allow"
    actions   = [
        "s3:ListAllMyBuckets",
        "s3:GetBucketLocation",
        "s3:*Object*"
        ]
    resources = ["arn:aws:s3:::airflow-infra-staging"]
  }
}

resource "aws_iam_policy" "airflow_policy" {
  name        = "airflow-policy"
  policy = data.aws_iam_policy_document.airflow_policy_document.json
}

resource "aws_iam_user_policy_attachment" "airflow_policy_attachment" {
  user       = aws_iam_user.airflow_user.name
  policy_arn = aws_iam_policy.airflow_policy.arn
}




data "aws_iam_policy_document" "rds_import_policy_document" {
  statement {
    effect = "Allow"
    actions   = [
        "s3:ListAllMyBuckets",
        "s3:GetBucketLocation",
        "s3:GetObject"
        ]
    resources = ["arn:aws:s3:::staging-olist"]
  }
}

resource "aws_iam_policy" "rds_policy" {
  name        = "rds-test-policy"
  policy = data.aws_iam_policy_document.rds_import_policy_document.json
}

