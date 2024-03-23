module "VPC" {
  source        = "./modules/VPC"
  vpc_cidr      = var.vpc_cidr[terraform.workspace]
  vpc_name      = var.vpc_name[terraform.workspace]
  subnet_1_cidr = var.subnet_1_cidr[terraform.workspace]
  subnet_1_name = var.subnet_1_name[terraform.workspace]
  subnet_2_cidr = var.subnet_2_cidr[terraform.workspace]
  subnet_2_name = var.subnet_2_name[terraform.workspace]
}
