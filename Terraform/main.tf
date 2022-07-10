# Configuration for provider

### Comment the secret manager lines as it is giving come cycle ERROR when running on localstack
data "aws_secretsmanager_secret_version" "creds" {
#Here db-credentials is the name of the "Secret" that you have given in AWS Secret Manager at the time of store in the form of json
  secret_id = "db-credentials"

}

locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

provider "aws" {
  region = var.region
  access_key                  = local.db_creds.access_key
  secret_key                  = local.db_creds.secret_key
##  access_key                  = "abc"
##  secret_key                  = "def"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true
  endpoints {
    ec2      = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
    iam      = "http://localhost:4566"


  }

}















