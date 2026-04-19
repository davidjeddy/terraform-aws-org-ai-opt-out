resource "aws_organizations_policy_attachment" "this" {
  for_each = { for account_id in data.aws_organizations_organization.this.accounts[*].id : account_id => account_id }

  policy_id = aws_organizations_policy.this.id
  target_id = each.value
}
