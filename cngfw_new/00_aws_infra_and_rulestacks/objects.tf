resource "cloudngfwaws_prefix_list" "kayana_ec2_pl" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  name        = "KayanaPocServers"
  description = "Kayana POC Servers Prefix List"
  prefix_list = [
    var.private_server_a_ip,
    var.private_server_b_ip,
    var.rds_server_c_ip
  ]
  audit_comment = "Pushed by Terraform"
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

resource "cloudngfwaws_fqdn_list" "eicar" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  name        = "eicar"
  description = "Test Case 2c"
  fqdn_list = [
    "www.eicar.org"
  ]
  audit_comment = "Pushed by Terraform"
}