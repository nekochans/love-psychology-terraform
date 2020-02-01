data "aws_acm_certificate" "main" {
  domain = "*.${lookup(
    var.main_domain_name,
    "${terraform.workspace}.name",
    var.main_domain_name["default.name"]
  )}"
}
