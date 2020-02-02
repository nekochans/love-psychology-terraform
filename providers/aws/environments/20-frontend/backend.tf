terraform {
  backend "s3" {
    bucket  = "stg-love-psychology-tfstate"
    key     = "frontend/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "love-psychology-stg"
  }
}

data "terraform_remote_state" "acm" {
  backend = "s3"

  config = {
    bucket  = "stg-love-psychology-tfstate"
    key     = "env:/${terraform.workspace}/acm/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "love-psychology-stg"
  }
}
