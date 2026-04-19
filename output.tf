output "policy" {
  value = try(aws_organizations_policy.this, null)
}
