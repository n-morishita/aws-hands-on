terraform {
  backend "s3" {
    bucket       = "study-tfstate"
    key          = "cicd/codebuild/terraform.tfstate"
    region       = "ap-northeast-1"
    encrypt      = true
    use_lockfile = true
  }
}
