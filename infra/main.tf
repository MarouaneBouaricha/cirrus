module "static-website" {
  source = "./static-website"

  environment = var.environment
  route53_zone_id = var.route53_zone_id
  domain = var.domain
  region = var.region
}
