module "network" {
  source = "./modules/network"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "ec2" {
  source = "./modules/ec2"

  project_name        = var.project_name
  vpc_id              = module.network.vpc_id
  subnet_id           = module.network.public_subnet_ids[0]
  vpc_cidr            = var.vpc_cidr
  instance_type       = var.instance_type
  key_name            = var.key_name
  associate_public_ip = true
}
