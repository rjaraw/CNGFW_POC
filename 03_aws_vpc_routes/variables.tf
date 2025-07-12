# Build path to AWS Infrastructure's Terraform state
data "terraform_remote_state" "aws_infra_and_rulestacks" {
  backend = "local"
  config = {
    path = "../00_aws_infra_and_rulestacks/terraform.tfstate"
  }
}
data "terraform_remote_state" "cloudngfw_resources" {
  backend = "local"
  config = {
    path = "../02_cloudngfw_resources/terraform.tfstate"
  }
}

# Variables - values retrieved from previous Terraform deployment, using the deployment's state as declared above
locals {
  aws_region = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.aws_region
  kayana_pri_sub_a_cidr = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_pri_sub_a_cidr
  kayana_pri_sub_b_cidr = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_pri_sub_b_cidr
  kayana_pri_sub_c_cidr = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_pri_sub_c_cidr
  kayana_rds_sub_a_cidr = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_rds_sub_a_cidr
  kayana_rds_sub_b_cidr = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_rds_sub_b_cidr
  kayana_rds_sub_c_cidr = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_rds_sub_c_cidr
  kayana_tgw_rt      = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_tgw_rt
  kayana_private_rt_a = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_private_rt_a
  kayana_private_rt_b = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_private_rt_b
  kayana_private_rt_c = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_private_rt_c
  kayana_rds_rt_a    = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_rds_rt_a
  kayana_rds_rt_b    = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_rds_rt_b
  kayana_rds_rt_c    = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_rds_rt_c
  kayana_cngfw_ep_a = data.terraform_remote_state.cloudngfw_resources.outputs.kayana_cngfw_ep_a
  kayana_cngfw_ep_b = data.terraform_remote_state.cloudngfw_resources.outputs.kayana_cngfw_ep_b
  kayana_cngfw_ep_c = data.terraform_remote_state.cloudngfw_resources.outputs.kayana_cngfw_ep_c
}