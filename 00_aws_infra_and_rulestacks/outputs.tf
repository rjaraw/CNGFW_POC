output "aws_account" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = var.aws_region
}

output "kayana_sec_sub_a" {
  value = data.aws_subnet.kayana_sec_sub_a.id
}

output "kayana_sec_sub_b" {
  value = data.aws_subnet.kayana_sec_sub_b.id
}

output "kayana_sec_sub_c" {
  value = data.aws_subnet.kayana_sec_sub_c.id
}

output "kayana_dev_vpc" {
  value = data.aws_vpc.kayana_dev_vpc.id
}

output "kayana_poc_rs" {
  value = cloudngfwaws_rulestack.kayana_poc_rs.name
}

output "kayana_pri_sub_a_cidr" {
  value = data.aws_subnet.kayana_pri_sub_a.cidr_block
}

output "kayana_pri_sub_b_cidr" {
  value = data.aws_subnet.kayana_pri_sub_b.cidr_block
}

output "kayana_pri_sub_c_cidr" {
  value = data.aws_subnet.kayana_pri_sub_c.cidr_block
}

output "kayana_rds_sub_a_cidr" {
  value = data.aws_subnet.kayana_rds_sub_a.cidr_block
}

output "kayana_rds_sub_b_cidr" {
  value = data.aws_subnet.kayana_rds_sub_b.cidr_block
}

output "kayana_rds_sub_c_cidr" {
  value = data.aws_subnet.kayana_rds_sub_c.cidr_block
}

output "kayana_tgw_rt" {
  value = data.aws_route_table.kayana_tgw_rt.id
}

output "kayana_private_rt_a" {
  value = data.aws_route_table.kayana_private_rt_a.id
}

output "kayana_private_rt_b" {
  value = data.aws_route_table.kayana_private_rt_b.id
}

output "kayana_private_rt_c" {
  value = data.aws_route_table.kayana_private_rt_c.id
}

output "kayana_rds_rt_a" {
  value = data.aws_route_table.kayana_rds_rt_a.id
}

output "kayana_rds_rt_b" {
  value = data.aws_route_table.kayana_rds_rt_b.id
}

output "kayana_rds_rt_c" {
  value = data.aws_route_table.kayana_rds_rt_c.id
}