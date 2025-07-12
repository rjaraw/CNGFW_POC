terraform {
  required_providers {
    cloudngfwaws = {
      source  = "PaloAltoNetworks/cloudngfwaws"
      version = "2.0.6"
    }
  }
}

provider "cloudngfwaws" {
  host             = "api.${var.aws_region}.aws.cloudngfw.paloaltonetworks.com"
  region           = var.aws_region
  lfa_arn          = "arn:aws:iam::506350273566:role/RjApiGatewayFullAccess"
  lra_arn          = "arn:aws:iam::506350273566:role/RjApiGatewayFullAccess"
  json_config_file = "/home/ec2-user/.cloudngfwaws_creds.json"
}