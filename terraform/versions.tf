terraform {
  required_version = ">=1.0.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.66.0"
    }
    # tls = {
    #   source  = "hashicorp/tls"
    #   version = ">=3.1.0"
    # }
    # vault = {
    #     source = "hashicorp/vault"
    # }
  }
}