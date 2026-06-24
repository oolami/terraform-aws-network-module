provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"