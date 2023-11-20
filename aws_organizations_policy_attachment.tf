resource "aws_organizations_policy_attachment" "this" {
  policy_id = aws_organizations_policy.this.id
  target_id = var.organization.id
}
