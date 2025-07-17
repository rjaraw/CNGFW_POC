variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
}

variable "aws_account" {
  description = "AWS Account"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the endpoints will be created."
  type        = string
}

variable "cngfw_name" {
  description = "The name of the Cloud NGFW instance."
  type        = string
}

variable "sec_a_sub_id" {
  description = "The ID of the subnet for endpoint A."
  type        = string
}

variable "sec_b_sub_id" {
  description = "The ID of the subnet for endpoint B."
  type        = string
}

variable "sec_c_sub_id" {
  description = "The ID of the subnet for endpoint C."
  type        = string
}