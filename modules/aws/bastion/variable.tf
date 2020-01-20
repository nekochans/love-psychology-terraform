variable "bastion" {
  type = map(string)

  default = {
    "default.name"          = "love-psychology-bastion"
    "default.ami"           = "ami-011facbea5ec0363b"
    "default.instance_type" = "t3.micro"
    "default.volume_type"   = "gp2"
    "default.volume_size"   = "8"
  }
}

variable "vpc" {
  type = map(string)

  default = {}
}

// TODO AWSアカウントがステージング本番で違うので後で環境変数として渡すように改修する
variable "ssh_public_key_path" {
  type = string

  default = "~/.ssh/stg_love_psychology_aws.pem.pub"
}
