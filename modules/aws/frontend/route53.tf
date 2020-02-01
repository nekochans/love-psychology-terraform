data "aws_route53_zone" "main" {
  name = lookup(
    var.main_domain_name,
    "${terraform.workspace}.name",
    var.main_domain_name["default.name"]
  )
}

resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.main.zone_id
  name = lookup(
    var.frontend,
    "${terraform.workspace}.sub_domain_name",
    var.frontend["default.sub_domain_name"]
  )
  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.love_psychology_web.domain_name
    zone_id                = aws_cloudfront_distribution.love_psychology_web.hosted_zone_id
    evaluate_target_health = false
  }
}
