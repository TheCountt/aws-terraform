provider "aws" {
  region = var.region
}

provider "tls" {}

provider "vault" {}