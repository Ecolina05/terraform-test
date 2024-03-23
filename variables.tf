variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}

variable "vpc_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.0.0/24"
    "dev"     = "192.168.1.0/24"
  }
}

variable "vpc_name" {
  type = map(string)
  default = {
    "default" = "vpc_itm_VPC_MODULE_default"
    "dev"     = "vpc_itm_VPC_MODULE_dev"
  }
}

variable "subnet_1_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.0.0/27"
    "dev"     = "192.168.1.0/27"
  }
}

variable "subnet_1_name" {
  type = map(string)
  default = {
    "default" = "subnet_itm_VPC_MODULE_default_1"
    "dev"     = "subnet_itm_VPC_MODULE_dev_1"
  }
}

variable "subnet_2_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.0.32/27"
    "dev"     = "192.168.1.32/27"
  }
}

variable "subnet_2_name" {
  type = map(string)
  default = {
    "default" = "subnet_itm_VPC_MODULE_default_2"
    "dev"     = "subnet_itm_VPC_MODULE_dev_2"
  }
}
