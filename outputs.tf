output "vpc_id" {
  description = "VPC ID for the Release cluster"
  value       = data.aws_vpc.release_cluster.id
}

output "security_group_id" {
  description = "Security group ID for the Release cluster"
  value       = data.aws_security_group.release_cluster.id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs for the Release cluster"
  value       = data.aws_subnets.release_cluster_private.ids
}

output "public_subnet_ids" {
  description = "List of public subnet IDs for the Release cluster"
  value       = data.aws_subnets.release_cluster_public.ids
}