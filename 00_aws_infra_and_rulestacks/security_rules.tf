resource "cloudngfwaws_security_rule" "aws_ssm" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 5
  name        = "AwsSsm"
  description = "Allow authentication traffic of POC EC2 instances to AWS SSM"
  source {
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
  }
  destination {
    cidrs = ["15.221.8.0/21", "52.119.184.0/22", "10.0.0.0/24"]
  }
  applications   = ["any"]
  prot_port_list = ["TCP:443"]
  category {}
  action               = "Allow"
  # decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_security_rule" "tc_1a" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 10
  name        = "TestCase1a"
  description = "This test case evaluates the ability of the CloudNGFW to allow/block applications."
  source {
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
  }
  destination {
    cidrs = ["any"]
  }
  applications = [
    "ssl",
    "git",
    "ssh",
    "web-browsing",
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
    cidrs = [var.private_server_a_ip]
  }
  destination {
    cidrs = ["any"]
  }
  applications = [
    "ssl",
    "websocket",
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

resource "cloudngfwaws_security_rule" "tc_1b_deny" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 25
  name        = "TestCase1bDeny"
  description = "This test case evaluates the  ability of the Cloud NGFW  to include source IP address/destination IP address in application control policies."
  source {
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
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
  action               = "DenySilent"
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
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
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

resource "cloudngfwaws_security_rule" "tc_1c_deny" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 35
  name        = "TestCase1cDeny"
  description = "This test case evaluates the ability of the Cloud NGFW to  identify and control applications running on ports other than the application’s default port. "
  source {
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
  }
  destination {
    cidrs = ["any"]
  }
  applications = ["ssh"]
  protocol     = "any"
  category {}
  action        = "DenySilent"
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
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
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
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
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

resource "cloudngfwaws_security_rule" "tc_2c" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 60
  name        = "TestCase2c"
  description = "This test case evaluates Cloud NGFW Threat prevention capabilities"
  source {
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
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

resource "cloudngfwaws_security_rule" "tc_4a" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 70
  name        = "TestCase4a"
  description = "Evaluate the NGFW’s performance under high traffic conditions."
  source {
    cidrs = [data.aws_subnet.kayana_pri_sub_a.cidr_block]
  }
  destination {
    cidrs = [data.aws_subnet.kayana_rds_sub_c.cidr_block]
  }
  applications = ["any"]
  protocol     = "application-default"
  category {
  }
  action               = "Allow"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_security_rule" "deny_poc" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 100
  name        = "DenyPOCServers"
  description = "Explicit deny POC EC2."
  source {
    prefix_lists = [cloudngfwaws_prefix_list.kayana_ec2_pl.name]
  }
  destination {
    cidrs = ["any"]
  }
  applications = ["any"]
  protocol     = "any"
  category {
  }
  action               = "DenySilent"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}

resource "cloudngfwaws_security_rule" "allow_any" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  rule_list   = "LocalRule"
  priority    = 110
  name        = "AllowAny"
  description = "Allow Any"
  source {
    cidrs = ["any"]
  }
  destination {
    cidrs = ["any"]
  }
  applications = ["any"]
  protocol     = "any"
  category {
  }
  action               = "Allow"
  decryption_rule_type = "SSLOutboundInspection"
  logging              = true
  audit_comment        = "Pushed by Terraform"
}