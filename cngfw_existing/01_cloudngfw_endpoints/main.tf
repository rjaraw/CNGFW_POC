resource "aws_vpc_endpoint" "kayana_cngfw_ep_a" {
  vpc_id            = var.vpc_id
  service_name      = data.cloudngfwaws_ngfw.kayana_poc_cngfw.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [var.sec_a_sub_id]

  tags = {
    Name = "cngfw_ep_a"
  }
}

resource "aws_vpc_endpoint" "kayana_cngfw_ep_b" {
  vpc_id            = var.vpc_id
  service_name      = data.cloudngfwaws_ngfw.kayana_poc_cngfw.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [var.sec_b_sub_id]

  tags = {
    Name = "cngfw_ep_b"
  }
}

resource "aws_vpc_endpoint" "kayana_cngfw_ep_c" {
  vpc_id            = var.vpc_id
  service_name      = data.cloudngfwaws_ngfw.kayana_poc_cngfw.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [var.sec_c_sub_id]

  tags = {
    Name = "cngfw_ep_c"
  }
}

# Cloud NGFW Data
data "cloudngfwaws_ngfw" "kayana_poc_cngfw" {
  name       = var.cngfw_name
  account_id = var.aws_account
}