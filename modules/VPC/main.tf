resource "aws_vpc" "vpc_itm_VPC_MODULE" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet_itm_VPC_MODULE_1" {
  vpc_id = aws_vpc.vpc_itm_VPC_MODULE.id

  cidr_block              = var.subnet_1_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.vpc_itm_VPC_MODULE]
  tags = {
    Name = var.subnet_1_name
  }
}

resource "aws_subnet" "subnet_itm_VPC_MODULE_2" {
  vpc_id = aws_vpc.vpc_itm_VPC_MODULE.id

  cidr_block              = var.subnet_2_cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.vpc_itm_VPC_MODULE]
  tags = {
    Name = var.subnet_2_name
  }
}

resource "aws_internet_gateway" "ig_itm_VPC_MODULE" {
  vpc_id = aws_vpc.vpc_itm_VPC_MODULE.id

  depends_on = [aws_vpc.vpc_itm_VPC_MODULE]
}

resource "aws_route_table" "rt_itm_VPC_MODULE" {
  vpc_id = aws_vpc.vpc_itm_VPC_MODULE.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_itm_VPC_MODULE.id
  }

  depends_on = [aws_internet_gateway.ig_itm_VPC_MODULE]
}

resource "aws_main_route_table_association" "rt_association_itm_VPC_MODULE" {
  vpc_id = aws_vpc.vpc_itm_VPC_MODULE.id

  route_table_id = aws_route_table.rt_itm_VPC_MODULE.id
}
