terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = ">= 2.0.0"
  }
}

locals {
  # Pattern to match the security group name for the Release cluster
  security_group_name_pattern = "eks-cluster-sg-${var.release_context}-*"

  # Pattern to match the private subnet names for the Release cluster
  private_subnet_names_pattern = "eksctl-${var.release_context}-cluster/SubnetPrivate*"

  # Pattern to match the public subnet names for the Release cluster
  public_subnet_names_pattern = "eksctl-${var.release_context}-cluster/SubnetPublic*"
}

# Get the security group for the Release cluster
data "aws_security_group" "release_cluster" {
  name = local.security_group_name_pattern
}

# Get the VPC for the Release cluster
data "aws_vpc" "release_cluster" {
  id = data.aws_security_group.release_cluster.vpc_id
}

# Get the private subnets for the Release cluster
data "aws_subnets" "release_cluster_private" {
  filter {
    name   = "tag:Name"
    values = [local.private_subnet_names_pattern]
  }
}

# Get the public subnets for the Release cluster
data "aws_subnets" "release_cluster_public" {
  filter {
    name   = "tag:Name"
    values = [local.public_subnet_names_pattern]
  }
}