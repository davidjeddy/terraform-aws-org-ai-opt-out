output "account_ids" {
  description = "(object) List of organizational account ids"
  value = data.aws_organizations_organization.this.accounts[*].id
}
