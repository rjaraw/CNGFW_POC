data "aws_caller_identity" "current" {}

# ============= SG Lab
# data "aws_vpc" "kayana_dev_vpc" {
#   id = "vpc-0b09566ad0b094571"
# }

# data "aws_subnet" "kayana_sec_sub_a" {
#   id = "subnet-02e1a876604bf8740"
# }

# data "aws_subnet" "kayana_sec_sub_b" {
#   id = "subnet-08a56573cd216d628"
# }

# data "aws_subnet" "kayana_sec_sub_c" {
#   id = "subnet-035a62b1c45c762ad"
# }

# data "aws_subnet" "kayana_pri_sub_a" {
#   id = "subnet-05e3f17af1cca11c1"
# }

# data "aws_subnet" "kayana_pri_sub_b" {
#   id = "subnet-0a5eae58823d4b31e"
# }

# data "aws_subnet" "kayana_pri_sub_c" {
#   id = "subnet-04dd839ca9d309251"
# }

# data "aws_subnet" "kayana_rds_sub_a" {
#   id = "subnet-0651a15ff2d6071f7"
# }

# data "aws_subnet" "kayana_rds_sub_b" {
#   id = "subnet-07e7f021adcc4aae4"
# }

# data "aws_subnet" "kayana_rds_sub_c" {
#   id = "subnet-0c8d002491ce06bf2"
# }

# data "aws_route_table" "kayana_tgw_rt" {
#   route_table_id = "rtb-0ba3ba086a20f20b8"
# }

# data "aws_route_table" "kayana_private_rt_a" {
#   route_table_id = "rtb-053277b77233d73e3"
# }

# data "aws_route_table" "kayana_private_rt_b" {
#   route_table_id = "rtb-0b12dfedc2e99e040"
# }

# data "aws_route_table" "kayana_private_rt_c" {
#   route_table_id = "rtb-088a3ef8133a8fb19"
# }

# data "aws_route_table" "kayana_rds_rt_a" {
#   route_table_id = "rtb-0890e4b1c97e9ee35"
# }

# data "aws_route_table" "kayana_rds_rt_b" {
#   route_table_id = "rtb-090b39feb6256ce5c"
# }

# data "aws_route_table" "kayana_rds_rt_c" {
#   route_table_id = "rtb-0e6793f67b4d51fd2"
# }


# # ============= Tokyo
# data "aws_vpc" "kayana_dev_vpc" {
#   id = "vpc-09cdbd387688e8743"
# }

# data "aws_subnet" "kayana_sec_sub_a" {
#   id = "subnet-0e50da075bbcdbe75"
# }

# data "aws_subnet" "kayana_sec_sub_b" {
#   id = "subnet-04418ebd1b5e38b7c"
# }

# data "aws_subnet" "kayana_sec_sub_c" {
#   id = "subnet-03f28024562974ffe"
# }

# data "aws_subnet" "kayana_pri_sub_a" {
#   id = "subnet-030a74e2182150e2f"
# }

# data "aws_subnet" "kayana_pri_sub_b" {
#   id = "subnet-0f2d2c072eeb8c6a4"
# }

# data "aws_subnet" "kayana_pri_sub_c" {
#   id = "subnet-07a8065dcc0c6fa79"
# }

# data "aws_subnet" "kayana_rds_sub_a" {
#   id = "subnet-0d8ac417a5343bb37"
# }

# data "aws_subnet" "kayana_rds_sub_b" {
#   id = "subnet-007c38f1f827e9972"
# }

# data "aws_subnet" "kayana_rds_sub_c" {
#   id = "subnet-0ecd9fe25b2dac2b7"
# }

# data "aws_route_table" "kayana_tgw_rt" {
#   route_table_id = "rtb-0591f1f8f7fba2b1f"
# }

# data "aws_route_table" "kayana_private_rt_a" {
#   route_table_id = "rtb-03eb997c1465eb3b3"
# }

# data "aws_route_table" "kayana_private_rt_b" {
#   route_table_id = "rtb-017b4a8e95b775611"
# }

# data "aws_route_table" "kayana_private_rt_c" {
#   route_table_id = "rtb-0608823e7bcbc9b1d"
# }

# data "aws_route_table" "kayana_rds_rt_a" {
#   route_table_id = "rtb-0e4879a5f4cf06754"
# }

# data "aws_route_table" "kayana_rds_rt_b" {
#   route_table_id = "rtb-0158a9bccd120cb91"
# }

# data "aws_route_table" "kayana_rds_rt_c" {
#   route_table_id = "rtb-0eb8902ad73b207ff"
# }


# # ============= Oregon
# data "aws_vpc" "kayana_dev_vpc" {
#   id = "vpc-08c9be98809209a8b"
# }

# data "aws_subnet" "kayana_sec_sub_a" {
#   id = "subnet-02c542cb2620c435d"
# }

# data "aws_subnet" "kayana_sec_sub_b" {
#   id = "subnet-0d81bb301d8628b94"
# }

# data "aws_subnet" "kayana_sec_sub_c" {
#   id = "subnet-004b04c9751401fa7"
# }

# data "aws_subnet" "kayana_pri_sub_a" {
#   id = "subnet-0c958b26613c99138"
# }

# data "aws_subnet" "kayana_pri_sub_b" {
#   id = "subnet-0400499aa92b19bfb"
# }

# data "aws_subnet" "kayana_pri_sub_c" {
#   id = "subnet-09ef609d1ca052377"
# }

# data "aws_subnet" "kayana_rds_sub_a" {
#   id = "subnet-04ca214494cd8a6ed"
# }

# data "aws_subnet" "kayana_rds_sub_b" {
#   id = "subnet-039f530d509597717"
# }

# data "aws_subnet" "kayana_rds_sub_c" {
#   id = "subnet-09f90b080c653d87b"
# }

# data "aws_route_table" "kayana_tgw_rt" {
#   route_table_id = "rtb-0a1e3150f68e7bd44"
# }

# data "aws_route_table" "kayana_private_rt_a" {
#   route_table_id = "rtb-0e7b0d1787ee33ff8"
# }

# data "aws_route_table" "kayana_private_rt_b" {
#   route_table_id = "rtb-0875c9e6968ceb6a6"
# }

# data "aws_route_table" "kayana_private_rt_c" {
#   route_table_id = "rtb-03715a32ca92ca428"
# }

# data "aws_route_table" "kayana_rds_rt_a" {
#   route_table_id = "rtb-0590a5f057ff854f0"
# }

# data "aws_route_table" "kayana_rds_rt_b" {
#   route_table_id = "rtb-045852166b3e05ad4"
# }

# data "aws_route_table" "kayana_rds_rt_c" {
#   route_table_id = "rtb-0bf17acdd6d9781b3"
# }


# ============= Canade Central
data "aws_vpc" "kayana_dev_vpc" {
  id = "vpc-0ffc226eba530c58d"
}

data "aws_subnet" "kayana_sec_sub_a" {
  id = "subnet-07ce7814a0324c5ee"
}

data "aws_subnet" "kayana_sec_sub_b" {
  id = "subnet-098cf573360e13786"
}

data "aws_subnet" "kayana_sec_sub_c" {
  id = "subnet-08ebb5cbc9a25a08d"
}

data "aws_subnet" "kayana_pri_sub_a" {
  id = "subnet-0315a861e4f86e6b0"
}

data "aws_subnet" "kayana_pri_sub_b" {
  id = "subnet-05a10bf3ef15c41d6"
}

data "aws_subnet" "kayana_pri_sub_c" {
  id = "subnet-03d02e8b02cf37483"
}

data "aws_subnet" "kayana_rds_sub_a" {
  id = "subnet-07eea89f0b4e0331d"
}

data "aws_subnet" "kayana_rds_sub_b" {
  id = "subnet-0a831204f72b46078"
}

data "aws_subnet" "kayana_rds_sub_c" {
  id = "subnet-0b32a10aa9b79bf17"
}

data "aws_route_table" "kayana_tgw_rt" {
  route_table_id = "rtb-073750dca3dff2bba"
}

data "aws_route_table" "kayana_private_rt_a" {
  route_table_id = "rtb-0446e8f03ebcf87c6"
}

data "aws_route_table" "kayana_private_rt_b" {
  route_table_id = "rtb-020181a18f559d66c"
}

data "aws_route_table" "kayana_private_rt_c" {
  route_table_id = "rtb-041e897aa3cfca996"
}

data "aws_route_table" "kayana_rds_rt_a" {
  route_table_id = "rtb-05491546ff99c81c4"
}

data "aws_route_table" "kayana_rds_rt_b" {
  route_table_id = "rtb-0e306b346e4474a3d"
}

data "aws_route_table" "kayana_rds_rt_c" {
  route_table_id = "rtb-06f5ba6698c560d00"
}