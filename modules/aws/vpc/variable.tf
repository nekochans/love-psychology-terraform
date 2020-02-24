variable "vpc" {
  type = map(string)

  default = {
    "default.az_1a"      = "ap-northeast-1a"
    "default.az_1c"      = "ap-northeast-1c"
    "default.az_1d"      = "ap-northeast-1d"
    "default.name"       = "prod-love-psychology-vpc"
    "stg.name"           = "stg-love-psychology-vpc"
    "default.cidr"       = "10.10.0.0/16"
    "stg.cidr"           = "10.11.0.0/16"
    "default.public_1a"  = "10.10.0.0/24"
    "default.public_1c"  = "10.10.1.0/24"
    "default.public_1d"  = "10.10.2.0/24"
    "stg.public_1a"      = "10.11.0.0/24"
    "stg.public_1c"      = "10.11.1.0/24"
    "stg.public_1d"      = "10.11.2.0/24"
    "default.private_1a" = "10.10.10.0/24"
    "default.private_1c" = "10.10.11.0/24"
    "default.private_1d" = "10.10.12.0/24"
    "stg.private_1a"     = "10.11.10.0/24"
    "stg.private_1c"     = "10.11.11.0/24"
    "stg.private_1d"     = "10.11.12.0/24"
  }
}

variable "nat_instance" {
  type = map(string)

  default = {
    "default.name"          = "prod-love-psychology-nat"
    "stg.name"              = "stg-love-psychology-nat"
    "default.ami"           = "ami-0af1df87db7b650f4"
    "default.instance_type" = "t2.micro"
    "default.volume_type"   = "gp2"
    "default.volume_size"   = "30"
  }
}
