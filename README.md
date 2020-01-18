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

## 初期設定

`docker-compose up -d` でTerraformのコンテナを立ち上げます。

Terraformの初期化を行います。以下の手順で初期化スクリプトを実行して下さい。

```
chmod 755 terraform-init-stg.sh
docker-compose exec terraform ./terraform-init-stg.sh
```

`docker-compose exec terraform sh` でコンテナの中に入ります。

以降、Terraformの実行はコンテナの中で行います。
