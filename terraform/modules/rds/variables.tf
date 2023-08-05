variable "db-sg" {
  description = "The DB security group"
  type = string
  default = ""
}

variable "private_subnets" {
  type        = list
  description = "Private subnets from DB subnets group"
}


variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}
