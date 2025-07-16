resource "cloudngfwaws_ngfw" "kayana_poc_cngfw" {
  name          = "kayanaTF"
  vpc_id        = local.kayana_dev_vpc
  account_id    = local.aws_account
  description   = "For Kayana Cloud NGFW Terraform Test Case"
  endpoint_mode = "CustomerManaged"
  subnet_mapping {
    availability_zone = "${local.aws_region}a"
  }

  subnet_mapping {
    availability_zone = "${local.aws_region}b"
  }

  subnet_mapping {
    availability_zone = "${local.aws_region}d"
  }

  rulestack = local.kayana_poc_rs
}