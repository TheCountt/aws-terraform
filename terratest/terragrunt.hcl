 # AWS S3 backend

remote_state {
  backend = "s3"
  generate = {
    path      = "backend-terragrunt.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "project-terragrunt"

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terragrunt-locks"
  }
}