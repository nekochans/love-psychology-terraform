variable "frontend" {
  type = map(string)

  default = {
    // TODO 本番のドメイン名は仮
    "default.sub_domain_name"        = "www"
    "stg.sub_domain_name"            = "stg-love-psychology"
    "default.hosting_bucket_name"    = "prod-love-psychology-web"
    "stg.hosting_bucket_name"        = "stg-love-psychology-web"
    "default.access_log_bucket_name" = "prod-love-psychology-web-logs"
    "stg.access_log_bucket_name"     = "stg-love-psychology-web-logs"
  }
}

// TODO この変数は後でドメイン名が決まったら正式に変更する
variable "main_domain_name" {
  type = map(string)

  default = {
    // TODO 本番のドメイン名は仮
    "default.name" = "nekochans.net"
    "stg.name"     = "nekochans.net"
  }
}

variable "acm" {
  type = map(string)

  default = {}
}
