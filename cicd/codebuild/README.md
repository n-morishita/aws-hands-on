# TODO
- 構成図の作成

# 動作確認
- initial_buildを実行する際に、AWS CLIを事前にインストールしておく必要がある

# クリーンアップ
s3バケットのファイルを削除してからterraform destroyを実施する
例）
```bash
aws s3 rm s3://sample-website-bucket-2f1cf91d --recursive
```