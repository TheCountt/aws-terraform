
// depends on vpc in network folder of staging env
dependencies {
  paths = ["../network"]
}


include {
  path = find_in_parent_folders()
}


terraform {
  source = "./modules/security"
}

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    vpc_id = "temporary-dummy-id"
  }
}

inputs = {
    vpc_id = dependency.network.outputs.vpc_id
}