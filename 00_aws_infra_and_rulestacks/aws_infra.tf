data "aws_caller_identity" "current" {}

data "aws_vpc" "kayana_dev_vpc" {
  id = "vpc-Oefcfd31cb444e9fd"
}

data "aws_subnet" "kayana_sec_sub_a" {
  id = "subnet-04155b708d66ff8c5"
}

data "aws_subnet" "kayana_sec_sub_b" {
  id = "subnet-Oe4efa5b25e62b4b1"
}

data "aws_subnet" "kayana_sec_sub_c" {
  id = "subnet-Oc66ec1deeaf22dle"
}

data "aws_subnet" "kayana_pri_sub_a" {
  id = "subnet-09ee9eca15d1c511d"
}

data "aws_subnet" "kayana_pri_sub_b" {
  id = "subnet-015b0c109b4551614"
}

data "aws_subnet" "kayana_pri_sub_c" {
  id = "subnet-05a596d4fc3d089ea"
}

data "aws_subnet" "kayana_rds_sub_a" {
  id = "subnet-0993f37a87da1a6a5"
}

data "aws_subnet" "kayana_rds_sub_b" {
  id = "subnet-Oe11b9e8f8fbfe0bZ"
}

data "aws_subnet" "kayana_rds_sub_c" {
  id = "subnet-06ced4a59ec88c6d7"
}

data "aws_route_table" "kayana_tgw_rt" {
  route_table_id = "rtb-04bcb12db069f923a"
}

data "aws_route_table" "kayana_private_rt_a" {
  route_table_id = "rtb-04794c0aff8329a1a"
}

data "aws_route_table" "kayana_private_rt_b" {
  route_table_id = "rtb-061d2f88a78eba367"
}

data "aws_route_table" "kayana_private_rt_c" {
  route_table_id = "rtb-065edda0a1032de3f"
}

data "aws_route_table" "kayana_rds_rt_a" {
  route_table_id = "rtb-037aae16122e0dc2f"
}

data "aws_route_table" "kayana_rds_rt_b" {
  route_table_id = "rtb-Oef8ebf0eaa922443"
}

data "aws_route_table" "kayana_rds_rt_c" {
  route_table_id = "rtb-01e0036f8f0aa5b14"
}