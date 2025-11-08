terraform {
  backend "s3" {
    bucket       = "study-tfstate"
    key          = "website/cloudfront/terraform.tfstate"
    region       = "ap-northeast-1"
    encrypt      = true
    use_lockfile = true
  }
}
