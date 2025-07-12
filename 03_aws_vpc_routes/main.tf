# Route to send traffic from private and rds subnets to the GWLB endpoints
resource "aws_route" "private_to_cngfw_a" {
  route_table_id         = local.kayana_private_rt_a
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "private_to_cngfw_b" {
  route_table_id         = local.kayana_private_rt_b
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "private_to_cngfw_c" {
  route_table_id         = local.kayana_private_rt_c
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}

resource "aws_route" "rds_to_cngfw_a" {
  route_table_id         = local.kayana_rds_rt_a
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "rds_to_cngfw_b" {
  route_table_id         = local.kayana_rds_rt_b
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "rds_to_cngfw_c" {
  route_table_id         = local.kayana_rds_rt_c
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}

# Route to send traffic from tgw subnets to the GWLB endpoints
resource "aws_route" "tgw_to_private_a" {
  route_table_id         = local.kayana_tgw_rt
  destination_cidr_block = local.kayana_private_sub_a.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a.id
}

resource "aws_route" "tgw_to_private_b" {
  route_table_id         = local.kayana_tgw_rt
  destination_cidr_block = local.kayana_private_sub_b.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_b.id
}

resource "aws_route" "tgw_to_private_c" {
  route_table_id         = local.kayana_tgw_rt
  destination_cidr_block = local.kayana_private_sub_c.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_c.id
}

resource "aws_route" "tgw_to_rds_a" {
  route_table_id         = local.kayana_tgw_rt
  destination_cidr_block = local.kayana_rds_sub_a.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a.id
}

resource "aws_route" "tgw_to_rds_b" {
  route_table_id         = local.kayana_tgw_rt
  destination_cidr_block = local.kayana_rds_sub_b.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_b.id
}

resource "aws_route" "tgw_to_rds_c" {
  route_table_id         = local.kayana_tgw_rt
  destination_cidr_block = local.kayana_rds_sub_c.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a.id
}