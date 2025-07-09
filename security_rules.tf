# resource "cloudngfwaws_security_rule" "allowall_secrule" {
#   rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
#   rule_list   = "LocalRule"
#   priority    = 5
#   name        = "Allow-All"
#   description = "Rule configured by Terraform"
#   source {
#     cidrs = ["any"]
#   }
#   destination {
#     cidrs = ["any"]
#   }
#   applications = ["any"]
#   protocol     = "application-default"
#   category {}
#   action        = "Allow"
#   logging       = true
#   audit_comment = "Pushed by Terraform"
# }

resource "cloudngfwaws_security_rule" "tc_1a" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 10
  name        = "TestCase1a"
  description = "This test case evaluates the ability of the CloudNGFW to allow/block applications."
  source {
    cidrs = ["any"]
  }
  destination {
    cidrs = ["any"]
  }
  applications = [
    "ssl",
    "github",
    "github-downloading",
    "github-copilot",
    "github-copilot-business",
    "github-editing",
    "github-posting",
    "github-uploading"
  ]
  protocol = "application-default"
  category {}
  action               = "Allow"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_security_rule" "tc_1b" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 20
  name        = "TestCase1b"
  description = "This test case evaluates the  ability of the Cloud NGFW  to include source IP address/destination IP address in application control policies."
  source {
    cidrs = ["10.40.12.10"]
  }
  destination {
    cidrs = ["any"]
  }
  applications = [
    "ssl",
    "openai-chatgpt",
    "openai",
    "openai-api"
  ]
  protocol = "application-default"
  category {}
  action               = "Allow"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_security_rule" "tc_1c" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 30
  name        = "TestCase1c"
  description = "This test case evaluates the ability of the Cloud NGFW to  identify and control applications running on ports other than the application’s default port. "
  source {
    cidrs = ["any"]
  }
  destination {
    cidrs = ["any"]
  }
  applications = ["ssh"]
  protocol     = "application-default"
  category {}
  action        = "Allow"
  logging       = true
  audit_comment = "Pushed by Terraform"
}

resource "cloudngfwaws_security_rule" "tc_2a" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 40
  name        = "TestCase2a"
  description = "This test case evaluates the ability of the Cloud NGFW to control websites access using predefined URL Categories"
  source {
    cidrs = ["any"]
  }
  destination {
    cidrs = ["any"]
  }
  applications = ["any"]
  protocol     = "application-default"
  category {
    url_category_names = ["shareware-and-freeware"]
  }
  action               = "Allow"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_security_rule" "tc_2b" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 50
  name        = "TestCase2b"
  description = "This test case evaluates the ability of the Cloud NGFW to support custom URL allow list, block list, and custom category."
  source {
    cidrs = ["any"]
  }
  destination {
    cidrs = ["any"]
  }
  applications = ["any"]
  protocol     = "application-default"
  category {
    url_category_names = [cloudngfwaws_custom_url_category.kayana_url.name]
  }
  action               = "Allow"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_custom_url_category" "kayana_url" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  name        = "KayanaCorporateURL"
  description = "Test Case 2b"
  url_list = [
    "kayana.ph",
    "pldthome.com",
    "smart.com.ph",
  ]
}

resource "cloudngfwaws_security_rule" "tc_2c" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 60
  name        = "TestCase2c"
  description = "This test case evaluates Cloud NGFW Threat prevention capabilities"
  source {
    cidrs = ["any"]
  }
  destination {
    fqdn_lists = [cloudngfwaws_fqdn_list.eicar.name]
  }
  applications = ["any"]
  protocol     = "application-default"
  category {}
  action               = "Allow"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_fqdn_list" "eicar" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  name        = "eicar"
  description = "Test Case 2c"
  fqdn_list = [
    "www.eicar.org"
  ]
  audit_comment = "Pushed by Terraform"
}