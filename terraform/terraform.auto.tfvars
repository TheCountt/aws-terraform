region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

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
  Owner-Email     = "demo.io"
  Managed-By      = "Terraform"
  Billing-Account = "1234567890"
}