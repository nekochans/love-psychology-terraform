terraform {
  backend "s3" {
    bucket  = "stg-love-psychology-tfstate"
    key     = "acm/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "love-psychology-stg"
  }
}
