variable "environment" {
  description = "The deployment environment (e.g., dev, qa, prod)"
  default = "dev"
  type        = string
}

variable "domain" {
    description = "Website domain name"
    type = string
}

variable "route53_zone_id" {
    description = " Hosted Zone ID for the domain"
    type = string
}

variable "region" {
  description = "AWS region for the resources"
}