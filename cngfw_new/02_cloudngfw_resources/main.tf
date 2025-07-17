resource "cloudngfwaws_ngfw_log_profile" "kayana_log_profile" {
  ngfw       = local.cloudngfw_name
  account_id = local.aws_account
  log_destination {
    destination_type = "CloudWatchLogs"
    destination      = "PaloAltoCloudNGFW"
    log_type         = "TRAFFIC"
  }
  log_destination {
    destination_type = "CloudWatchLogs"
    destination      = "PaloAltoCloudNGFW"
    log_type         = "THREAT"
  }
  log_destination {
    destination_type = "CloudWatchLogs"
    destination      = "PaloAltoCloudNGFW"
    log_type         = "DECRYPTION"
  }
}

resource "aws_vpc_endpoint" "kayana_cngfw_ep_a" {
  vpc_id            = local.kayana_dev_vpc
  service_name      = local.service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [local.kayana_sec_sub_a]

  tags = {
    Name = "cngfw_ep_a"
  }
}

resource "aws_vpc_endpoint" "kayana_cngfw_ep_b" {
  vpc_id            = local.kayana_dev_vpc
  service_name      = local.service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [local.kayana_sec_sub_b]

  tags = {
    Name = "cngfw_ep_b"
  }
}

resource "aws_vpc_endpoint" "kayana_cngfw_ep_c" {
  vpc_id            = local.kayana_dev_vpc
  service_name      = local.service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [local.kayana_sec_sub_c]

  tags = {
    Name = "cngfw_ep_c"
  }
}