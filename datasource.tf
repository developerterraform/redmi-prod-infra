data "aws_route53_zone" "zoneinfo" {
  name         = var.domain_name
  private_zone = false
}
