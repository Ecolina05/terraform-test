variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}

variable "shared_credentials_file" {
  default = "/Users/ecolina/.aws/credentials"
}

variable "vpc_cidr" {
  default = "172.30.0.0/16"
}

variable "subnet_1_cidr" {
  default = "172.30.0.0/24"
}

variable "subnet_2_cidr" {
  default = "172.30.1.0/24"
}
