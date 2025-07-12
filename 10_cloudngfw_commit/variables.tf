# Build path to AWS Infrastructure's Terraform state
data "terraform_remote_state" "aws_infra_and_rulestacks" {
  backend = "local"
  config = {
    path = "../00_aws_infra_and_rulestacks/terraform.tfstate"
  }
}

# Variables - values retrieved from previous Terraform deployment, using the deployment's state as declared above
locals {
  kayana_poc_rs    = data.terraform_remote_state.aws_infra_and_rulestacks.outputs.kayana_poc_rs
}