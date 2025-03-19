# Terraform の設定ブロック
terraform {
  # 必要なTerraformのバージョンを指定（1.10.0 以上のバージョンで動作）
  required_version = "~> 1.10.0"

  # 必要なプロバイダーの定義
  required_providers {
    aws = {
      source  = "hashicorp/aws" # AWSプロバイダーの提供元
      version = "~> 5.83.0"     # 5.83.0 以上のバージョンを使用（5.xの範囲内）
    }
  }
}

# AWS プロバイダーの設定
provider "aws" {
  region = "ap-northeast-1" # 東京リージョンを指定

  # デフォルトで適用するタグの設定（全てのAWSリソースに適用される）
  default_tags {
    tags = {
      Environment = "dev" # 環境を示すタグ（開発環境）
    }
  }
}


module "module" {
  source = "../modules"

  #subnet
  private_subnet_map = {
    az_a = {
      cidr_block = "10.0.1.0/24"
      az         = "a"
    }
    az_c = {
      cidr_block = "10.0.2.0/24"
      az         = "c"
    }
  }
  public_subnet_map = {
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
