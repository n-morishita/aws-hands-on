terraform {
  backend "s3" {
    bucket = "study-s3-tfstate"
    region = "ap-northeast-1"
    key    = "study/terraform.tfstate"
  }
}
