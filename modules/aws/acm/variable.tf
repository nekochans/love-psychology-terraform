// TODO この変数は後でドメイン名が決まったら正式に変更する
variable "main_domain_name" {
  type = map(string)

  default = {
    // TODO 本番のドメイン名は仮
    "default.name" = "nekochans.net"
    "stg.name"     = "nekochans.net"
  }
}
