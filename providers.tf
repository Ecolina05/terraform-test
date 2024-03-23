terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
  backend "local" {
    path = "/Users/ecolina/Documents/terraform-project/itm.tfstate"
  }
}

provider "aws" {
  region                   = var.aws_region
  profile                  = var.aws_profile
}
