terraform {
  backend "s3" {
    bucket  = "stg-love-psychology-tfstate"
    key     = "network/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "love-psychology-stg"
  }
}
