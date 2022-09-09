variable "subnets-compute" {
    description = "public subnetes for compute instances"
}
variable "ami-bastion" {
    type = string
    description = "ami for bastion"
}
variable "ami-nginx" {
    type = string
    description = "ami for nginx"
}
variable "ami-webserver" {
    type = string
    description = "ami for webserver"
}
variable "sg-compute" {
    description = "security group for compute instances"
}
variable "keypair" {
    type = string
    description = "keypair for instances"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}