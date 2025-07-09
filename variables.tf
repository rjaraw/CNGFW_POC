variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_account" {
  description = "AWS Account"
  type        = string
  default     = "430118856206"
}

variable "forward_trust_arn" {
  description = "Forward Trust Certificate ARN"
  type        = string
  default     = "arn:aws:secretsmanager:ap-northeast-2:506350273566:secret:Kayana-Forward-Trust-CA-Z4l462"
}

variable "forward_untrust_arn" {
  description = "Forward Untrust Certificate ARN"
  type        = string
  default     = "arn:aws:secretsmanager:ap-northeast-2:506350273566:secret:Kayana-Forward-Untrust-CA-xHgrV4"
}