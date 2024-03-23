resource "aws_vpc" "VPCITMaVSCode" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPCITMIaCVCode"
  }
}

resource "aws_subnet" "SUBNET_ITMIaX_1_VSCode" {
  vpc_id = aws_vpc.VPCITMaVSCode.id

  cidr_block              = var.subnet_1_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.VPCITMaVSCode]
  tags = {
    Name = "Subnet 1 by terraform"
  }
}

resource "aws_subnet" "SUBNET_ITMIaX_2_VSCode" {
  vpc_id = aws_vpc.VPCITMaVSCode.id

  cidr_block              = var.subnet_2_cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.VPCITMaVSCode]
  tags = {
    Name = "Subnet 2 by terraform"
  }
}

resource "aws_internet_gateway" "IGITMIac_VSCode" {
  vpc_id = aws_vpc.VPCITMaVSCode.id

  depends_on = [aws_vpc.VPCITMaVSCode]
  tags = {
    Name = "IG-ITMIac_VSCode by terraform"
  }
}

resource "aws_route_table" "RT-ITMIac_VSCode" {
  vpc_id = aws_vpc.VPCITMaVSCode.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGITMIac_VSCode.id
  }

  depends_on = [aws_internet_gateway.IGITMIac_VSCode]
  tags = {
    Name = "RT-ITMIac_VSCode by terraform"
  }
}

resource "aws_main_route_table_association" "RT_Association" {
  vpc_id = aws_vpc.VPCITMaVSCode.id

  route_table_id = aws_route_table.RT-ITMIac_VSCode.id
}

resource "aws_network_acl" "NACL-ITMIac_VSCode" {
  vpc_id = aws_vpc.VPCITMaVSCode.id

  egress {
    protocol   = "ssh"
    rule_no    = 200
    action     = "allow"
    cidr_block = "172.30.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "https|"
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.30.0.0/16"
    from_port  = 443
    to_port    = 443
  }

  tags = {
    Name = "NACL-ITMIac_VSCode by terraform"
  }
}
