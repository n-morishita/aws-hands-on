- Terraformのインストール (main.tfのrequired_versionとバージョンを同じにする)

- AWS_ACCESS_KEY_IDとAWS_SECRET_ACCESS_KEYを事前に作成
IAM -> ユーザー -> <自身のユーザー> -> セキュリティ認証情報 -> アクセスキー -> アクセスキーを作成 

- backend用のS3を事前に作成

```bash
# 接続情報の設定
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION="ap-northeast-1"

cd dev/

terraform init
terraform plan
terraform apply
```


```bash
# クリーンアップ
terraform destroy
```