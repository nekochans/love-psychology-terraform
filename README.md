# love-psychology-terraform

以下のWebサービスのインフラを管理します。

- https://github.com/nekochans/love-psychology-web
- https://github.com/nekochans/triangular-theory-api

ステージング環境と本番環境でそれぞれ別々のAWSアカウントを利用する想定です。

## 事前準備

### `tfstate` 保存用のS3バケットを作成

`tfstate` をS3バケットに保存します。

これらのS3バケットを事前に作成しておきます。

- stg-love-psychology-tfstate
- prod-love-psychology-tfstate

### AWSのクレデンシャルをプロファイル付きで設定

`~/.aws/credentials` を以下のように設定します。

```
[love-psychology-stg]
aws_access_key_id = アクセスキーID
aws_secret_access_key = アクセスキーシークレット

[love-psychology-prod]
aws_access_key_id = アクセスキーID
aws_secret_access_key = アクセスキーシークレット
```

これらのプロファイル情報をTerraformが参照します。

Terraformは様々なAWSリソースを作成します。

よってアクセス権を絞るのは非常に難しいと思うので `AdministratorAccess` を与えるのが無難だと思います。
