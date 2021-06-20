provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name                 = "assignment1"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_db_subnet_group" "assignment1" {
  name       = "assignment1"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "assignment1"
  }
}

resource "aws_security_group" "rds" {
  name   = "assignment1_rds"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "assignment1_rds"
  }
}

resource "aws_db_parameter_group" "assignment1" {
  name   = "assignment1"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = var.log_connections
  }
}

resource "aws_db_instance" "assignment1" {
  name					 = var.db_name
  identifier             = "assignment1"
  instance_class         = "db.t3.micro"
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  engine                 = "postgres"
  engine_version         = "13.1"
  username               = "assignment1"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.assignment1.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.assignment1.name
  publicly_accessible    = var.publicly_access
  skip_final_snapshot    = var.skip_final_snapshot
  multi_az				 = var.multi_az
}
