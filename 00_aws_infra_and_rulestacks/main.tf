resource "cloudngfwaws_rulestack" "kayana_poc_rs" {
  name        = "kayana-terraform-poc"
  scope       = "Local"
  account_id  = var.aws_account
  description = "Made by Terraform"
  profile_config {
    url_filtering                = "BestPractice"
    outbound_trust_certificate   = "Kayana-Forward-Trust-CA"
    outbound_untrust_certificate = "Kayana-Forward-Untrust-CA"
  }
}

resource "cloudngfwaws_certificate" "kayana_trust" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  name        = cloudngfwaws_rulestack.kayana_poc_rs.profile_config[0].outbound_trust_certificate
  description = "Test Case 3a"
  signer_arn  = var.forward_trust_arn
  # self_signed   = true
  audit_comment = "Pushed by Terraform"
}

resource "cloudngfwaws_certificate" "kayana_untrust" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  name        = cloudngfwaws_rulestack.kayana_poc_rs.profile_config[0].outbound_untrust_certificate
  description = "Test Case 3a"
  signer_arn  = var.forward_untrust_arn
  # self_signed   = true
  audit_comment = "Pushed by Terraform"
}