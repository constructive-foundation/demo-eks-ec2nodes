
module "vpc" {
  source               = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v2.48.0"
  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.vpc_private_subnets
  public_subnets       = var.vpc_public_subnets
  enable_nat_gateway   = var.nat_enable
  single_nat_gateway   = var.single_nat_enable
  enable_dns_hostnames = var.enable_dns_hostnames
}