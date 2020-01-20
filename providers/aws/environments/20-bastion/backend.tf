terraform {
  required_version = "=0.12.19"

  backend "s3" {
    bucket  = "stg-love-psychology-tfstate"
    key     = "bastion/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "love-psychology-stg"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket  = "stg-love-psychology-tfstate"
    key     = "env:/${terraform.workspace}/network/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "love-psychology-stg"
  }
}

