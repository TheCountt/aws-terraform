# create instance for bastion
resource "aws_instance" "bastion" {
  ami                         = var.ami-bastion
  instance_type               = "t2.micro"
  subnet_id                   = var.subnets-compute
  vpc_security_group_ids      = var.sg-compute
  associate_public_ip_address = true
  key_name                    = var.keypair

 tags = merge(
    var.tags,
    {
      Name = "ACS-bastion"
    },
  )
}


#create instance for nginx
resource "aws_instance" "nginx" {
  ami                         = var.ami-nginx
  instance_type               = "t2.medium"
  subnet_id                   = var.subnets-compute
  vpc_security_group_ids      = var.sg-compute
  associate_public_ip_address = true
  key_name                    = var.keypair


   tags = merge(
    var.tags,
    {
      Name = "ACS-nginx"
    },
  )
}

# create instance for webservers
resource "aws_instance" "webserver" {
  ami                         = var.ami-webserver
  instance_type               = "t2.medium"
  subnet_id                   = var.subnets-compute
  vpc_security_group_ids      = var.sg-compute
  associate_public_ip_address = true
  key_name                    = var.keypair


  tags = merge(
    var.tags,
    {
      Name = "ACS-webserver"
    },
  )
}