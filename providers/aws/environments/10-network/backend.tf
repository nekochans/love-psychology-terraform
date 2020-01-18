terraform {
  required_version = "=0.12.19"

  backend "s3" {
    bucket  = "stg-love-psychology-tfstate"
    key     = "network/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "love-psychology-stg"
  }
}
