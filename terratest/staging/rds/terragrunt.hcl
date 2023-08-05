// depends on vpc in network folder of staging env
dependencies {
  paths = ["../network","../security"]
}


include {
  path = find_in_parent_folders()
}

terraform {
  source = "./modules/rds"
}

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    vpc_id = "temporary-dummy-id"
  }
}

dependency "security" {
  config_path = "../security"

  // mock_outputs = {
  //   vpc_id = "temporary-dummy-id"
  // }
}


inputs = {
    db-sg = dependency.security.outputs.datalayer-sg
    private_subnets = [dependency.network.outputs.private_subnets-3, dependency.network.outputs.private_subnets-4]

tags = {
    Owner-Email     = "demo.io",
    Managed-By      = "Terraform",
    Billing-Account = "1234567890"
    }

}

