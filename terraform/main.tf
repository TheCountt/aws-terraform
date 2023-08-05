# Module for network; This module will create all the neccessary resources for the entire project,
#such as vpc, subnets, gateways and all neccssary things to enable proper connectivity
module "network" {
  source                              = "./modules/network"
  region                              = var.region
  vpc_cidr                            = var.vpc_cidr
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  environment                         = var.environment 
}


# The module creates instances for various servers
# module "compute" {
#   source          = "./modules/compute"
#   ami-bastion     = var.ami-bastion
#   ami-nginx       = var.ami-nginx
#   ami-webserver   = var.ami-webserver
#   subnets-compute = module.network.public_subnets-1
#   sg-compute      = [module.security.compute-sg]
#   keypair         = var.keypair
# }

# The module creates security group for instances
# module "security" {
#   source = "./modules/security"
#   vpc_id = module.network.vpc_id
# }

#Module for Application Load balancer, this will create Extenal Load balancer and internal load balancer
# module "alb" {
#   source             = "./modules/alb"
#   name               = "ACS-ext-alb"
#   vpc_id             = module.network.vpc_id
#   public-sg          = module.security.alb-sg
#   private-sg         = module.security.ialb-sg
#   public-sbn-1       = module.network.public_subnets-1
#   public-sbn-2       = module.network.public_subnets-2
#   private-sbn-1      = module.network.private_subnets-1
#   private-sbn-2      = module.network.private_subnets-2
#   load_balancer_type = "application"
#   ip_address_type    = "ipv4"
# }



# module "autoscaling" {
#   source            = "./modules/autoscaling"
#   ami-webserver     = var.ami-webserver
#   ami-bastion       = var.ami-bastion
#   ami-nginx         = var.ami-nginx
#   desired_capacity  = 1
#   min_size          = 1
#   max_size          = 1
#   web-sg            = [module.security.web-sg]
#   bastion-sg        = [module.security.bastion-sg]
#   nginx-sg          = [module.security.nginx-sg]
#   wordpress-alb-tgt = module.alb.wordpress-tgt
#   nginx-alb-tgt     = module.alb.nginx-tgt
#   tooling-alb-tgt   = module.alb.tooling-tgt
#   instance_profile  = module.network.instance_profile
#   public_subnets    = [module.network.public_subnets-1, module.network.public_subnets-2]
#   private_subnets   = [module.network.private_subnets-1, module.network.private_subnets-2]
#   keypair           = var.keypair

# }

# Module for Elastic Filesystem; this module will creat elastic file system isn the webservers availablity
# zone and allow traffic fro the webservers

# module "efs" {
#   source       = "./modules/efs"
#   efs-subnet-1 = module.network.private_subnets-1
#   efs-subnet-2 = module.network.private_subnets-2
#   efs-sg       = [module.security.datalayer-sg]
#   account_no   = var.account_no
# }

# RDS module; this module will create the RDS instance in the private subnet

# module "rds" {
#   source          = "./modules/rds"
#   db-sg           = [module.security.datalayer-sg]
#   private_subnets = [module.network.private_subnets-3, module.network.private_subnets-4]
# }

