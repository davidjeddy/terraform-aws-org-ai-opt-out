resource "aws_organizations_policy" "this" {
  description = "Opt out of all Amazon AI services at an organization level"
  name        = "OptOutOfAllAIServicesPolicy"
  type        = "AISERVICES_OPT_OUT_POLICY"

  content = local.optOutPolicy
}

resource "aws_organizations_policy_attachment" "this" {
  policy_id = aws_organizations_policy.this.id
  target_id = var.organization.id
}
