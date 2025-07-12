# Build path to AWS Infrastructure's Terraform state
data "terraform_remote_state" "aws_infra_and_rulestacks" {
  backend = "local"
  config = {
    path = "../00_aws_infra_and_rulestacks/terraform.tfstate"
  }
}
data "terraform_remote_state" "cloudngfw" {
  backend = "local"
  config = {
    path = "../01_cloudngfw/terraform.tfstate"
  }
}

# Variables - values retrieved from previous Terraform deployment, using the deployment's state as declared above
locals {
  aws_account     = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.aws_account
  kayana_dev_vpc   = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_dev_vpc
  kayana_sec_sub_a = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_sec_sub_a
  kayana_sec_sub_b = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_sec_sub_b
  kayana_sec_sub_c = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_sec_sub_c
  cloudngfw_name = data.terraform_remote_state.cloudngfw.outputs.cloudngfw_name
  service_name = data.terraform_remote_state.cloudngfw.outputs.service_name
}