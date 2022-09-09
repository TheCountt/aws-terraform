##creating bucket for s3 backend
#########################
/* resource "aws_s3_bucket" "terraform_state" {
  bucket = "project-demo"

  versioning {
    enabled = true
  }
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
} */


# terraform {
#   backend "s3" {
#     bucket         = "project-demo"
#     key            = "global/s3/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }

terraform {
  backend "remote" {
    organization = "isaac-demo"

    workspaces {
      name = "aws-terraform/terraform"
    }
  }
}