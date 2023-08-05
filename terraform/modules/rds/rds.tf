# create DB subnet group from the private subnets
resource "aws_db_subnet_group" "ACS-rds" {
  name       = "acs-rds"
  subnet_ids = var.private_subnets

  tags = merge(
    var.tags,
    {
      Name = "ACS-dbsubnet-group"
    },
  )
}



# create the RDS instance with the subnets group
resource "aws_db_instance" "ACS-rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  db_name                = "demodb" 
  username             = local.db_secret.username
  password             = local.db_secret.password
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.ACS-rds.name

  # this should be changed to true for live dev & prod
  skip_final_snapshot    = true 
  # final_snapshot_identifier = "put suitable name"
  vpc_security_group_ids = [var.db-sg]
  multi_az               = "true"
  tags = merge(
    var.tags,
    {
      Name = "ACS-database"
    },
  )
}
