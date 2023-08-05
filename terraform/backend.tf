#creating bucket for s3 backend
########################
resource "aws_s3_bucket" "terraform_state" {
  bucket = "project-demo"
  force_destroy = true

}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket  = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status  = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket  = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm   = "AES256"
    }
  }
}

# Explicity block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "public-access-block" {
  bucket  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

# # AWS S3 backend
# terraform {
#   backend "s3" {
#     bucket         = "project-demo"
#     key            = "global/s3/terraform.tfstate"
#     region         = "eu-west-2"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }


# # terraform cloud backend 
# terraform {
#   backend "remote" {
#     organization = "isaac-demo"

#     workspaces {
#       name = "aws-terraform/terraform"
#     }
#   }
# }