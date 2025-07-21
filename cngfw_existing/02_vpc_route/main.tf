# Import existing VPC routes
import {
  to = aws_route.def_rt_private_sub_a
  id = "${var.private_route_table_a_id}_0.0.0.0/0"
}

import {
  to = aws_route.def_rt_private_sub_b
  id = "${var.private_route_table_b_id}_0.0.0.0/0"
}

import {
  to = aws_route.def_rt_private_sub_c
  id = "${var.private_route_table_c_id}_0.0.0.0/0"
}

import {
  to = aws_route.def_rt_rds_sub_a
  id = "${var.rds_route_table_a_id}_0.0.0.0/0"
}

import {
  to = aws_route.def_rt_rds_sub_b
  id = "${var.rds_route_table_b_id}_0.0.0.0/0"
}

import {
  to = aws_route.def_rt_rds_sub_c
  id = "${var.rds_route_table_c_id}_0.0.0.0/0"
}

# Modify private and rds subnets default route via GWLB endpoints
resource "aws_route" "def_rt_private_sub_a" {
  route_table_id         = var.private_route_table_a_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "def_rt_private_sub_b" {
  route_table_id         = var.private_route_table_b_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "def_rt_private_sub_c" {
  route_table_id         = var.private_route_table_c_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}

resource "aws_route" "def_rt_rds_sub_a" {
  route_table_id         = var.rds_route_table_a_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "def_rt_rds_sub_b" {
  route_table_id         = var.rds_route_table_b_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "def_rt_rds_sub_c" {
  route_table_id         = var.rds_route_table_c_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}

# Create tgw subnet return route to private and rds subnets via Cloud NGFW Endpoints
resource "aws_route" "tgw_to_private_a" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_sub_a.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "tgw_to_private_b" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_sub_b.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "tgw_to_private_c" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_sub_c.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}

resource "aws_route" "tgw_to_private_dslab_a" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_dslab_sub_a.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "tgw_to_private_dslab_b" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_dslab_sub_b.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "tgw_to_private_dslab2_a" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_dslab2_sub_a.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "tgw_to_private_dslab2_b" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_dslab2_sub_b.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "tgw_to_private_c360_a" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_c360_sub_a.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "tgw_to_private_c360_b" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.private_c360_sub_b.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "tgw_to_rds_a" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.rds_sub_a.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "tgw_to_rds_b" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.rds_sub_b.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "tgw_to_rds_c" {
  route_table_id         = var.tgw_route_table_id
  destination_cidr_block = data.aws_subnet.rds_sub_c.cidr_block
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}

# AWS Subnets Data
data "aws_subnet" "private_sub_a" {
  id = var.private_subnet_a_id
}

data "aws_subnet" "private_sub_b" {
  id = var.private_subnet_b_id
}

data "aws_subnet" "private_sub_c" {
  id = var.private_subnet_c_id
}

data "aws_subnet" "private_dslab_sub_a" {
  id = var.private_dslab_subnet_a_id
}

data "aws_subnet" "private_dslab_sub_b" {
  id = var.private_dslab_subnet_b_id
}

data "aws_subnet" "private_dslab2_sub_a" {
  id = var.private_dslab2_subnet_a_id
}

data "aws_subnet" "private_dslab2_sub_b" {
  id = var.private_dslab2_subnet_b_id
}

data "aws_subnet" "private_c360_sub_a" {
  id = var.private_c360_subnet_a_id
}

data "aws_subnet" "private_c360_sub_b" {
  id = var.private_c360_subnet_b_id
}

data "aws_subnet" "rds_sub_a" {
  id = var.rds_subnet_a_id
}

data "aws_subnet" "rds_sub_b" {
  id = var.rds_subnet_b_id
}

data "aws_subnet" "rds_sub_c" {
  id = var.rds_subnet_c_id
}