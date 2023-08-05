variable "region" {}

variable "vpc_cidr" {}

variable "enable_dns_support" {}

variable "enable_dns_hostnames" {}

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of private subnets"
}

variable "name" {
  type    = string
  default = "ACS"

}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "environment" {
  type        = string
  description = "Enviroment"
}

variable "ami-bastion" {
  type        = string
  description = "AMI ID for the launch template"
}


variable "ami-webserver" {
  type        = string
  description = "AMI ID for the launch template"
}


variable "ami-nginx" {
  type        = string
  description = "AMI ID for the launch template"
}

variable "keypair" {
  type        = string
  description = "key pair for the instances"
}

variable "account_no" {
  type        = number
  description = "the account number"
}

variable "administrator" {
  type        = list(string)
  description = "name of cloud administrators"
}

variable "developer" {
  type        = list(string)
  description = "name of developers"
}

variable "developer_policies" {
  type  = list(string)
  description = "policies definining developer access and permissions"
}