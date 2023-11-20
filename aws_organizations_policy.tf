resource "aws_organizations_policy" "this" {
  depends_on = [
    terraform_data.this
  ]

  name        = "OptOutOfAllAIServicesPolicy"
  type        = "AISERVICES_OPT_OUT_POLICY"
  description = "Opt-out of Amazon AI/ML service/s at an organization level."

  content     = jsonencode(var.optOutPolicy)
}
