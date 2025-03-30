terraform {
  required_version = "~> 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Environment = "dev"
    }
  }
}

module "module" {
  source = "../modules"

  #subnet
  public_subnet_map = {
    az_a = {
      cidr_block = "10.0.1.0/24"
      az         = "a"
    }
    az_c = {
      cidr_block = "10.0.2.0/24"
      az         = "c"
    }
  }
  private_subnet_map = {
    az_a = {
      cidr_block = "10.0.11.0/24"
      az         = "a"
    }
    az_c = {
      cidr_block = "10.0.12.0/24"
      az         = "c"
    }
  }
}
