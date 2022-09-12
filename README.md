# aws-terraform

# Infrastructure Architecture

----

![architecture](https://user-images.githubusercontent.com/76074379/123254593-b4064680-d4a3-11eb-8099-329e9fb7c060.png)

## Steps
- Create Golden Images(AMI) with Packer by Hashicorp
- Provision resources within a virtual network using Terraform (VPC, Security, Compute, ALB, Autoscaling, EFS, RDS)
	- Configure Terraform to use S3 or Terraform Cloud as backends
	- Create domain names and certificates for your two companies
	- Make sure you tag the resources properly
- Ansible for configuration management
- Update Terraform file  with new AMI IDs
- Update ansible scripts with the following values from terraform outputs:
   - RDS enpoints for tooling and wordpress
   - Database name, password and username for tooling and wordpress
   - Access point ID for tooling and wordpress
   - Internal Load balancer DNS for nginx reverse-proxy

 ## Problems to work on
 - Hardcoding of values
 - Inputting credentials directly into the script