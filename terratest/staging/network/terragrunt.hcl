include {
  path = find_in_parent_folders()
}

terraform {
  source = "./modules/network"
}

inputs = {
  
region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

private_subnets = [for i in range(1, 8, 2) : cidrsubnet("10.0.0.0/16", 8, i)]

public_subnets = [for i in range(2, 5, 2) : cidrsubnet("10.0.0.0/16", 8, i)]

environment = "dev"

ami-webserver = "ami-02c95bd60862a1681"

ami-bastion = "ami-007810479c053de66"

ami-nginx = "ami-0ea109604ddcb2c90"

keypair = "devops"

account_no = "696742900004"

administrator = ["susan", "celtigar"]

developer = ["pat", "ren"]

developer_policies = ["AmazonEC2FullAccess", "AmazonRDSFullAccess", "AmazonEKSClusterPolicy", 
"AmazonEKSWorkerNodePolicy", "AmazonEC2ContainerRegistryReadOnly", "AmazonEKS_CNI_Policy"]

tags = {
  Owner-Email     = "demo.io",
  Managed-By      = "Terraform",
  Billing-Account = "1234567890"
      }
}