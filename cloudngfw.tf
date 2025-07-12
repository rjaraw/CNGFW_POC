resource "cloudngfwaws_ngfw" "kayana_poc_cngfw" {
  name          = "kayanaTF"
  vpc_id        = data.aws_vpc.kayana_dev_vpc.id
  account_id    = var.aws_account
  description   = "For Kayana Cloud NGFW Terraform Test Case"
  endpoint_mode = "CustomerManaged"
  subnet_mapping {
    availability_zone = "${var.aws_region}a"
  }

  subnet_mapping {
    availability_zone = "${var.aws_region}b"
  }

  subnet_mapping {
    availability_zone = "${var.aws_region}c"
  }

  rulestack = cloudngfwaws_commit_rulestack.kayana_poc_crs.rulestack

  depends_on = [
    cloudngfwaws_rulestack.kayana_poc_rs
  ]
}

resource "cloudngfwaws_commit_rulestack" "kayana_poc_crs" {
  rulestack = cloudngfwaws_rulestack.kayana_poc_rs.name
}

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
  name        = "Kayana-Forward-Trust-CA" # cloudngfwaws_rulestack.kayana_poc_rs.profile_config[0].outbound_trust_certificate
  description = "Test Case 3a"
  signer_arn  = var.forward_trust_arn
  # self_signed   = true
  audit_comment = "Pushed by Terraform"
}

resource "cloudngfwaws_certificate" "kayana_untrust" {
  rulestack   = cloudngfwaws_rulestack.kayana_poc_rs.name
  name        = "Kayana-Forward-Untrust-CA" # cloudngfwaws_rulestack.kayana_poc_rs.profile_config[0].outbound_untrust_certificate
  description = "Test Case 3a"
  signer_arn  = var.forward_untrust_arn
  # self_signed   = true
  audit_comment = "Pushed by Terraform"
}

resource "cloudngfwaws_ngfw_log_profile" "kayana_log_profile" {
  ngfw       = cloudngfwaws_ngfw.kayana_poc_cngfw.name
  account_id = cloudngfwaws_ngfw.kayana_poc_cngfw.account_id
  log_destination {
    destination_type = "CloudWatchLogs"
    destination      = "KayanaCNGFW"
    log_type         = "TRAFFIC"
  }
  log_destination {
    destination_type = "CloudWatchLogs"
    destination      = "KayanaCNGFW"
    log_type         = "THREAT"
  }
  log_destination {
    destination_type = "CloudWatchLogs"
    destination      = "KayanaCNGFW"
    log_type         = "DECRYPTION"
  }
}
# =============================================================================
#  PLAN 2
# =============================================================================
# Execute after CNGFW instance creation

# # GWLB Endpoints for each NGFW subnet
# resource "aws_vpc_endpoint" "kayana_cngfw_ep_a" {
#   vpc_id            = data.aws_vpc.kayana_dev_vpc.id
#   service_name      = cloudngfwaws_ngfw.kayana_poc_cngfw.endpoint_service_name
#   vpc_endpoint_type = "GatewayLoadBalancer"

#   subnet_ids = [
#     data.aws_subnet.kayana_sec_sub_a.id
#   ]

#   tags = {
#     Name = "cngfw_ep_a"
#   }
# }

# resource "aws_vpc_endpoint" "kayana_cngfw_ep_b" {
#   vpc_id            = data.aws_vpc.kayana_dev_vpc.id
#   service_name      = cloudngfwaws_ngfw.kayana_poc_cngfw.endpoint_service_name
#   vpc_endpoint_type = "GatewayLoadBalancer"

#   subnet_ids = [
#     data.aws_subnet.kayana_sec_sub_a.id
#   ]

#   tags = {
#     Name = "cngfw_ep_b"
#   }
# }

# resource "aws_vpc_endpoint" "kayana_cngfw_ep_c" {
#   vpc_id            = data.aws_vpc.kayana_dev_vpc.id
#   service_name      = cloudngfwaws_ngfw.kayana_poc_cngfw.endpoint_service_name
#   vpc_endpoint_type = "GatewayLoadBalancer"

#   subnet_ids = [
#     data.aws_subnet.kayana_sec_sub_a.id
#   ]

#   tags = {
#     Name = "cngfw_ep_c"
#   }
# }


# # =============================================================================
#  PLAN 3
# =============================================================================
# # Execute after endpoint creation

# # Route to send traffic from private and rds subnets to the GWLB endpoints
# resource "aws_route" "private_to_cngfw_a" {
#   route_table_id         = data.aws_route_table.kayana_private_rt_a.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_a.id
# }

# resource "aws_route" "private_to_cngfw_b" {
#   route_table_id         = data.aws_route_table.kayana_private_rt_b.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_b.id
# }

# resource "aws_route" "private_to_cngfw_c" {
#   route_table_id         = data.aws_route_table.kayana_private_rt_c.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_c.id
# }

# resource "aws_route" "rds_to_cngfw_a" {
#   route_table_id         = data.aws_route_table.kayana_rds_rt_a.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_a.id
# }

# resource "aws_route" "rds_to_cngfw_b" {
#   route_table_id         = data.aws_route_table.kayana_rds_rt_b.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_b.id
# }

# resource "aws_route" "rds_to_cngfw_c" {
#   route_table_id         = data.aws_route_table.kayana_rds_rt_c.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_c.id
# }

# # Route to send traffic from tgw subnets to the GWLB endpoints
# resource "aws_route" "tgw_to_private_a" {
#   route_table_id         = data.aws_route_table.kayana_tgw_rt.id
#   destination_cidr_block = "10.40.12.0/22"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_a.id
# }

# resource "aws_route" "tgw_to_private_b" {
#   route_table_id         = data.aws_route_table.kayana_tgw_rt.id
#   destination_cidr_block = "10.40.16.0/22"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_b.id
# }

# resource "aws_route" "tgw_to_private_c" {
#   route_table_id         = data.aws_route_table.kayana_tgw_rt.id
#   destination_cidr_block = "10.40.20.0/22"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_c.id
# }

# resource "aws_route" "tgw_to_rds_a" {
#   route_table_id         = data.aws_route_table.kayana_tgw_rt.id
#   destination_cidr_block = "10.40.24.0/24"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_a.id
# }

# resource "aws_route" "tgw_to_rds_b" {
#   route_table_id         = data.aws_route_table.kayana_tgw_rt.id
#   destination_cidr_block = "10.40.25.0/24"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_b.id
# }

# resource "aws_route" "tgw_to_rds_c" {
#   route_table_id         = data.aws_route_table.kayana_tgw_rt.id
#   destination_cidr_block = "10.40.26.0/24"
#   vpc_endpoint_id        = aws_vpc_endpoint.kayana_cngfw_ep_c.id
# }