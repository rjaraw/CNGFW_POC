variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
}

variable "aws_account" {
  description = "AWS Account"
  type        = string
}

variable "forward_trust_arn" {
  description = "Forward Trust Certificate ARN"
  type        = string
}

variable "forward_untrust_arn" {
  description = "Forward Untrust Certificate ARN"
  type        = string
}

# variable "root_cert_arn" {
#   description = "Root Certificate ARN"
#   type        = string
#   default     = ""
# }

variable "private_server_a_ip" {
  description = "Kayana POC Private Server A"
  type        = string
}

variable "private_server_b_ip" {
  description = "Kayana POC Private Server B"
  type        = string
}

variable "rds_server_c_ip" {
  description = "Kayana POC RDS Server C"
  type        = string
}