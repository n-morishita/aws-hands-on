terraform {
  backend "s3" {
    bucket = "study-s3-tfstate"  # Terraformの状態ファイル（tfstate）を保存するS3バケット名(事前に作成)
    region = "ap-northeast-1"    # S3バケットのリージョン（東京リージョン）
    key    = "study/terraform.tfstate" # S3バケット内でのtfstateファイルの保存パス
  }
}
